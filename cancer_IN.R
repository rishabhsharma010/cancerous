cancer1 <- cancer |>
  select(country,cancer_type)|>
  dplyr::filter(country=="India")|>
  group_by(cancer_type)|>
  summarize(count =n())

total <- apply(cancer1[,2],MARGIN=2,FUN=sum)
cancer1$percentage <- (cancer1$count/total)*100
cancer1$percentage <- round(cancer1$percentage,2)

p<-ggplot(cancer1,aes(x=reorder(cancer_type, percentage), y= percentage,fill=cancer_type)) +
  geom_col(width=0.6,show.legend=F) +
  geom_text(aes(label=percentage),vjust=-0.5,size=2.5)+
  scale_fill_viridis_d("cancer_type")+
  scale_y_continuous(limits=c(0,15))+
  labs(
    x="Cancer Type",
    y="Percentage(%)",
    title="Cancer Classification in India (2015-2024)"
  )+ theme_classic()+
  theme(
    axis.text.x=element_text(angle=45,hjust=1,size=8,color="black"))

ggsave(
  "cancer_IN.png",
  plot=p,
  width = 1200,
  height = 900,
  unit = "px"
)