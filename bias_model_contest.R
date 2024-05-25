library(tidyverse)
library(tidymodels)

train <- read_csv("data/train.csv")

train |>
  glimpse()

train |>
  count(Outgroup)


# decision tree regression model
bias_mod <- decision_tree() |>
  set_engine("rpart") |>
  set_mode("regression")

bias_recipe <- recipe(bias ~ generalized + disgust_p,
                      data = train)

bias_workflow <- workflow() |>
  add_model(bias_mod) |>
  add_recipe(bias_recipe)

bias_fit <- fit(bias_workflow, data = train)

bias_fit |>
  extract_fit_parsnip() |>
  rpart::rpart.plot()
