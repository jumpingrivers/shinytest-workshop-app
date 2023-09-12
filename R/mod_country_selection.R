#' country_selection UI Function
#'
#' @description A shiny Module.
#'
#' @param   id   Internal parameters for {shiny}.
#'
#' @noRd

mod_country_selection_ui <- function(id) {
  ns <- NS(id)
  tagList(
    selectInput(
      inputId = ns("country_selection"),
      label = "Select some countries",
      choices = NULL,
      multiple = TRUE
    )
  )
}

#' country_selection Server Functions
#'
#' @param   id   Parameter to link the UI and server components.
#' @param   rx_dataset   Reactive data-frame. Must contain 'country' and 'region'
#'
#' @noRd

mod_country_selection_server <- function(id, rx_dataset) {
  stopifnot(is.reactive(rx_dataset))

  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    all_countries <- reactive({
      sort(unique(rx_dataset()[["country"]]))
    })

    available_countries <- reactive({
      all_countries()
    })

    observe({
      req(available_countries())

      updateSelectInput(
        session = session,
        inputId = "country_selection",
        choices = available_countries(),
        selected = NULL
      )
    })

    return(
      list(
        countries = reactive(input$country_selection)
      )
    )
  })
}

## To be copied in the UI
# mod_country_selection_ui("country_selection_1")

## To be copied in the server
# mod_country_selection_server("country_selection_1")
