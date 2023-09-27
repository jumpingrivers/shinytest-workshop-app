library(shinytest2)

test_that("data filtering by region", {
  shiny_obj <- unstats::run_app()
  app <- AppDriver$new(shiny_obj, width = 1062, height = 904)

  app$set_inputs(
    `sidebar-countries-regions-user_selected` = c("Caribbean", "EasternAfrica", "EasternEurope")
  )

  app$wait_for_idle(500)
  app$expect_values()
})
