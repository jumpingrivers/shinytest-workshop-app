#' table UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_table_ui <- function(id) {
  ns <- NS(id)

  tagList(
    DT::DTOutput(ns("table"))
  )
}

#' table Server Functions
#'
#' @noRd
mod_table_server <- function(id,
                             rx_plotting_dataset,
                             rx_x_var,
                             rx_y_var) {
  stopifnot(is.reactive(rx_plotting_dataset))
  stopifnot(is.reactivevalues(rx_x_var))
  stopifnot(is.reactivevalues(rx_y_var))

  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    presented_table <- reactive({
      req(rx_x_var$name)
      req(rx_y_var$name)

      required_cols <- c("country", rx_x_var$name, rx_y_var$name)

      rx_plotting_dataset() |>
        dplyr::select(dplyr::all_of(required_cols)) |>
        dplyr::rename(
          "{rx_x_var$label}" := rx_x_var$name,
          "{rx_y_var$label}" := rx_y_var$name
        )
    })

    output$table <- DT::renderDT({
      presented_table()
    })
  })
}

#' Module for presenting / formatting a table - as an app
#'
#' @export

mod_table_app <- function(id = "table",
                          rx_plotting_dataset,
                          rx_x_var,
                          rx_y_var) {
  ui <- tagList(
    golem_add_external_resources(),
    mod_table_ui(id)
  )

  shinyApp(
    ui = ui,
    server = function(input, output, server) {
      mod_table_server(id, rx_plotting_dataset, rx_x_var, rx_y_var)
    }
  )
}

## To be copied in the UI
# mod_table_ui("table_1")

## To be copied in the server
# mod_table_server("table_1")
