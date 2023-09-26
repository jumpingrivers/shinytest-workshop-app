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

  sidebar_params <- mod_sidebar_server("sidebar", rx_dataset)

  rx_plotting_dataset <- reactive({
    dplyr::filter(
      rx_dataset(),
      .data[["country"]] %in% sidebar_params$countries()
    )
  })

  mod_content_server(
    "content",
    rx_plotting_dataset,
    x_variable = sidebar_params$x_var,
    y_variable = sidebar_params$y_var
  )
}
