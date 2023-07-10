# Quadratic Discriminant Analysis

qda_model <- discrim_quad() %>% 
  set_mode("classification") %>% 
  set_engine("MASS")

qda_wkflow <- workflow() %>% 
  add_model(qda_model) %>% 
  add_recipe(recipe)

qda_fit <- fit(qda_wkflow, train_data)

qda_kfold_fit <- fit_resamples(qda_wkflow, folds)

save(qda_kfold_fit, file='qda_model.rda')