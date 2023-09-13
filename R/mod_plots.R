#' plots UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList

mod_plots_ui <- function(id) {
  ns <- NS(id)
  tagList(
    plotOutput(ns("scatter"))
  )
}

#' plots Server Functions
#'
#' @noRd

mod_plots_server <- function(id,
                             rx_plotting_dataset,
                             rx_x_var,
                             rx_y_var) {
  stopifnot(is.reactive(rx_plotting_dataset))
  stopifnot(is.reactivevalues(rx_x_var))
  stopifnot(is.reactivevalues(rx_y_var))

  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    output$scatter <- renderPlot({
      req(rx_x_var$name)
      req(rx_y_var$name)

      ggplot2::ggplot(
        data = rx_plotting_dataset(),
        mapping = ggplot2::aes(
          x = .data[[rx_x_var$name]],
          y = .data[[rx_y_var$name]]
        )
      ) +
        ggplot2::geom_point()
    })
  })
}

## To be copied in the UI
# mod_plots_ui("plots_1")

## To be copied in the server
# mod_plots_server("plots_1")
