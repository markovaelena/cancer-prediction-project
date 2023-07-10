# K-Nearest Neighbors model

load("model_setup.rda")

set.seed(3435)

knn_model <- nearest_neighbor(neighbors = tune()) %>%
  set_mode("classification") %>%
  set_engine("kknn")

knn_wkflow <- workflow() %>% 
  add_model(knn_model) %>% 
  add_recipe(recipe)

neighbors_grid <- grid_regular(neighbors(range = c(1, 10)), levels = 10)

tune_res_knn <- tune_grid(
  object = knn_wkflow, 
  resamples = folds, 
  grid = neighbors_grid
)

save(tune_res_knn, file='knn_model.rda')
