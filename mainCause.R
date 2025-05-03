# function to determine the major cause for a cancer type in a particular country
mainCause <- function(Country,cr_type){
  cr_type <- str_to_title(cr_type)

  type <-cancer |> pull(cancer_type)
  type <- unique(type)

  cnt <- cancer |> pull(country)
  cnt <- unique(cnt)

  if(!(Country %in% cnt)){
    stop("Invalid country input.Country does not exist in the database.")
  }

  if(!(cr_type %in% type)){
    stop("Invalid cancer type.Does not exist in the database.")
  }

cncr <-cancer |>
  select(country,year,cancer_type,genetic_risk,air_pollution,alcohol_use,smoking,obesity_level)

cols_to_compare <- c("genetic_risk","air_pollution","alcohol_use","smoking","obesity_level")
cncr$main_cause <- names(cncr[,cols_to_compare])[max.col(cncr[,cols_to_compare])]

cncr <- cncr |>
  group_by(country,cancer_type,main_cause) |>
  summarize(count = n(),.groups="keep")
cncr <- cncr |>
  ungroup(main_cause) |>
  group_by(country,cancer_type) |>
  slice_max(order_by=count) |>
  dplyr::filter(country == Country & cancer_type == cr_type) |>
  pull(main_cause)

cncr <- str_replace(cncr,"_"," ")
cncr <- str_to_title(cncr)

print(cncr)

}
