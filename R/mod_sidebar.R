#' sidebar UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_sidebar_ui <- function(id) {
  ns <- NS(id)

  tagList(
    mod_country_selection_ui(ns("countries")),
    mod_variable_selection_ui(ns("x_variable"), "X-axis variable"),
    mod_variable_selection_ui(ns("y_variable"), "Y-axis variable")
  )
}

#' sidebar Server Functions
#'
#' @noRd
mod_sidebar_server <- function(id,
                               rx_dataset) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    rx_countries <- mod_country_selection_server("countries", rx_dataset)
    rx_x_var <- mod_variable_selection_server("x_variable", rx_dataset)
    rx_y_var <- mod_variable_selection_server("y_variable", rx_dataset)

    list(
      countries = rx_countries,
      x_var = rx_x_var,
      y_var = rx_y_var
    )
  })
}

## To be copied in the UI
# mod_sidebar_ui("sidebar_1")

## To be copied in the server
# mod_sidebar_server("sidebar_1")
