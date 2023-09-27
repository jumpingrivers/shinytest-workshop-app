library(shinytest2)

test_that("data filtering by region", {
  shiny_obj <- unstats::run_app()
  app <- AppDriver$new(shiny_obj)

  app$set_window_size(width = 1062, height = 904)
  app$set_inputs(`sidebar-countries-regions-user_selected` = "Caribbean")
  app$set_inputs(`sidebar-countries-regions-user_selected` = c("Caribbean", "EasternAfrica"))
  app$set_inputs(`sidebar-countries-regions-user_selected` = c("Caribbean", "EasternAfrica", "EasternEurope"))
  app$expect_values()
})
