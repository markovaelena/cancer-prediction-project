# Linear Discriminant Analysis

lda_model <- discrim_linear() %>% 
  set_mode("classification") %>% 
  set_engine("MASS")

lda_wkflow <- workflow() %>% 
  add_model(lda_model) %>% 
  add_recipe(recipe)

lda_fit <- fit(lda_wkflow, train_data)

lda_kfold_fit <- fit_resamples(lda_wkflow, folds)

save(lda_kfold_fit, file='lda_model.rda')