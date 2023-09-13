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
      inputId = ns("region_selection"),
      label = "Filter countries by region",
      choices = NULL,
      multiple = TRUE
    ),
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

    all_regions <- reactive({
      ds <- rx_dataset()
      stopifnot("region" %in% colnames(ds))
      sort(unique(ds[["region"]]))
    })

    available_countries <- reactive({
      ds <- rx_dataset()
      stopifnot("country" %in% colnames(ds))

      filtered <- if (!isTruthy(input$region_selection)) {
        ds
      } else {
        dplyr::filter(ds, .data[["region"]] %in% input$region_selection)
      }

      sort(unique(filtered[["country"]]))
    })

    observe({
      updateSelectInput(
        session = session,
        inputId = "region_selection",
        choices = all_regions(),
        selected = NULL
      )
    })

    observe({
      updateSelectInput(
        session = session,
        inputId = "country_selection",
        choices = available_countries(),
        selected = NULL
      )
    })

    return(
      reactive(input$country_selection)
    )
  })
}

## To be copied in the UI
# mod_country_selection_ui("country_selection_1")

## To be copied in the server
# mod_country_selection_server("country_selection_1")
