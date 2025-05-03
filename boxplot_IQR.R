cancer2 <- cancer |>
  select(cancer_type,cancer_stage,survival_years,treatment_cost) |>
  group_by(cancer_type,cancer_stage) |>
  summarize(survival_years = IQR(survival_years),
            treatment_cost = IQR(treatment_cost)) |>
  ungroup()

View(cancer2)
p<-ggplot(cancer2,aes(x=survival_years,y=treatment_cost,color=factor(cancer_stage)))+
  geom_point()+
  geom_boxplot(alpha=0.6,outlier.color="black")+
  labs(color= "Cancer Stage")+
  labs(
    x="Survival Years",
    y="Treatment Cost (USD)",
    title="Box-plot of IQR(survival years and treatment cost) for different cancer stages"
  )+theme_classic()+
  theme(plot.title = element_text(size=8))+
  theme(axis.title.x=element_text(size=8))+
  theme(axis.title.y=element_text(size=8))+
  theme(legend.title=element_text(size=8))+
  theme(legend.text=element_text(size=8))

ggsave(
  "boxplot_IQR.png",
  plot = p,
  width = 1500,
  height = 900,
  units = "px"
)
