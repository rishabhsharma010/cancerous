# function to show median of survival years w.r.t. different countries

survivalMedian <- function(Country,cr_type,cr_stage){
  cr_type <- str_to_title(cr_type)
  cr_stage <- str_to_title(cr_stage)

  type <-cancer |> pull(cancer_type)
  type <- unique(type)

  Stage <- cancer |> pull(cancer_stage)
  Stage <- unique(Stage)

  cnt <- cancer |> pull(country)
  cnt <- unique(cnt)

  if(!(Country %in% cnt)){
    stop("Invalid country input.Country does not exist in the database.")
  }

  if(!(cr_type %in% type)){
    stop("Invalid cancer type.Does not exist in the database.")
  }

  if(!(cr_stage %in% Stage)){
    stop("Invalid cancer stage.Does not exist in the database.")
  }

  can <- cancer |>
    group_by(cancer_type,cancer_stage,country) |>
    summarize(years = median(survival_years),.groups="drop") |>
    ungroup() |>
    dplyr::filter(country == Country & cancer_type == cr_type & cancer_stage == cr_stage)|>
    pull(years)

  print(paste0(can," years"))
}







