library(shinytest2)

test_that("Initial Shiny values are consistent", {
  shiny_obj <- unstats::run_app()
  app <- AppDriver$new(shiny_obj)

  app$expect_values()
})
