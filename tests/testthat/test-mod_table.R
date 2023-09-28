library(shinytest2)

test_that("table is formatted correctly", {
  rx_table <- reactive(
    tibble::tibble(country = letters[1:3], x = 1:3, y = 4:6)
  )
  rx_x_var <- reactiveValues(name = "x", label = "X")
  rx_y_var <- reactiveValues(name = "y", label = "Y")

  shiny_obj <- unstats::mod_table_app(
    rx_plotting_dataset = rx_table,
    rx_x_var = rx_x_var,
    rx_y_var = rx_y_var
  )
  app <- AppDriver$new(shiny_obj, name = "table_formatting")

  app$expect_values()
})
