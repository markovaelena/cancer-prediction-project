# Elastic Net Logistic Regression

enlr_model <- logistic_reg(mixture = tune(), 
                             penalty = tune()) %>%
  set_mode("classification") %>%
  set_engine("glmnet")
enlr_wkflow <- workflow() %>% 
  add_recipe(recipe) %>% 
  add_model(enlr_model)

enlr_grid <- grid_regular(penalty(range = c(0, 1), trans = identity_trans()),
                          mixture(range = c(0, 1)), levels = 10)

tune_res_enlr <- tune_grid(
  object = enlr_wkflow,
  resamples = folds, 
  grid = enlr_grid
)

save(tune_res_enlr, enlr_wkflow, file='enlr_model.rda')