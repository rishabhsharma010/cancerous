# loading all the necessary libraries
library(conflicted)
library(tidyverse)
library(dplyr)
library(usethis)
library(devtools)
library(testthat)

# reading csv file into a tibble
cancer <- read_csv("cancer-data.csv")

# converting column names into lowercase
colnames(cancer) <- str_to_lower(colnames(cancer))

# selecting and renaming imp. attributes
cancer <- cancer |>
  select(
    patient_id,
    age,
    gender,
    country = country_region,
    year,
    genetic_risk,
    air_pollution,
    alcohol_use,
    smoking,
    obesity_level,
    cancer_type,
    cancer_stage,
    treatment_cost =treatment_cost_usd,
    survival_years
  )
# replacing values from cancer_stage column (roman to numeric)
cancer <- cancer |>
  mutate(cancer_stage = replace(cancer_stage,cancer_stage=="Stage I","Stage 1"))|>
  mutate(cancer_stage = replace(cancer_stage,cancer_stage=="Stage II","Stage 2")) |>
  mutate(cancer_stage = replace(cancer_stage,cancer_stage=="Stage III","Stage 3")) |>
  mutate(cancer_stage = replace(cancer_stage,cancer_stage=="Stage IV","Stage 4"))

# saving the tibble into a file
save(cancer,file="cancer.RData")
