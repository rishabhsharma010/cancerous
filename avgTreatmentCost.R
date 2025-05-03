# function for calculating avg treatment cost for different types of cancer

avgTreatmentCost <- function(type, stage){
    type <- str_to_title(type)
    stage <- str_to_title(stage)

    # creating a vector unique values from cancer_type column
    Type <-cancer |> pull(cancer_type)
    Type <- unique(Type)

    # creating a vector of unique values from cancer_stage column
    Stage <- cancer |> pull(cancer_stage)
    Stage <- unique(Stage)

    # checking if user input is valid
    if(!(type %in% Type)){
      stop("Invalid cancer type.Does not exist in the database.")
    }

    if(!(stage %in% Stage)){
      stop("Invalid cancer stage.Does not exist in the database.")
    }

    cancer_cost <- cancer |>
      group_by(cancer_type,cancer_stage) |>
      summarize(avg_cost = round(mean(treatment_cost)),.groups="drop") |>
      ungroup() |>
      dplyr::filter(cancer_type == type & cancer_stage ==stage) |>
      pull(avg_cost)

    print(paste0("Average treatment cost for ",stage," ",type," cancer: $",cancer_cost))

}

