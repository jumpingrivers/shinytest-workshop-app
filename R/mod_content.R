#' content UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_content_ui <- function(id) {
  ns <- NS(id)
  tagList(
    mod_plots_ui(ns("plot")),
    mod_table_ui(ns("table"))
  )
}

#' content Server Functions
#'
#' @noRd
mod_content_server <- function(id,
                               rx_plotting_dataset,
                               x_variable,
                               y_variable) {
  stopifnot(is.reactive(rx_plotting_dataset))
  stopifnot(is.reactivevalues(x_variable))
  stopifnot(is.reactivevalues(y_variable))

  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    mod_plots_server(
      "plot",
      rx_plotting_dataset,
      x_variable,
      y_variable
    )

    mod_table_server(
      "table",
      rx_plotting_dataset,
      x_variable,
      y_variable
    )
  })
}

## To be copied in the UI
# mod_content_ui("content_1")

## To be copied in the server
# mod_content_server("content_1")
