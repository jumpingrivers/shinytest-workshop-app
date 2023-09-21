library(shinytest2)

test_that("Initial Shiny values are consistent", {
  shiny_app <- unstats::run_app()
  app <- AppDriver$new(shiny_app)

  app$expect_values()
})
