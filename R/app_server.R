#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#'
#' @import   shiny
#' @importFrom   rlang   .data
#'
#' @noRd

app_server <- function(input, output, session) {
  dataset <- unstats::un_data
  rx_dataset <- reactive(dataset)

  rx_countries <- mod_country_selection_server("countries", rx_dataset)
  rx_x_var <- mod_variable_selection_server("x_variable", rx_dataset)
  rx_y_var <- mod_variable_selection_server("y_variable", rx_dataset)

  rx_plotting_dataset <- reactive({
    dplyr::filter(
      rx_dataset(), .data[["country"]] %in% rx_countries()
    )
  })

  mod_plots_server("plot", rx_plotting_dataset, rx_x_var, rx_y_var)
}
