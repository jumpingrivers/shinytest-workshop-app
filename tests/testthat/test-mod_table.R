test_that("formatted table has correct columns", {
  rx_table <- reactive(
    tibble::tibble(country = letters[1:3], x = 1:3, y = 4:6)
  )
  rx_x_var <- reactiveValues(name = "x", label = "X")
  rx_y_var <- reactiveValues(name = "y", label = "Y")
  arg_list <- list(
    rx_plotting_dataset = rx_table, rx_x_var = rx_x_var, rx_y_var = rx_y_var
  )
  testServer(
    mod_table_server,
    args = arg_list,
    {
      expect_equal(
        colnames(presented_table()),
        c("country", "X", "Y")
      )
    }
  )
})
