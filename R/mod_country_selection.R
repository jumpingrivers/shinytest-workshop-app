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
    mod_dynamic_selector_ui(ns("regions"), "Filter countries by region", multiple = TRUE),
    mod_dynamic_selector_ui(ns("countries"), "Select some countries", multiple = TRUE)
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

    rx_selected_regions <- mod_dynamic_selector_server(
      id = "regions",
      choices = all_regions,
      selected = reactive(NULL)
    )

    available_countries <- reactive({
      ds <- rx_dataset()
      stopifnot("country" %in% colnames(ds))

      filtered <- if (!isTruthy(rx_selected_regions())) {
        ds
      } else {
        dplyr::filter(ds, .data[["region"]] %in% rx_selected_regions())
      }

      sort(unique(filtered[["country"]]))
    })

    rx_selected_countries <- mod_dynamic_selector_server(
      id = "countries",
      choices = available_countries,
      selected = reactive(NULL)
    )

    return(
      rx_selected_countries
    )
  })
}

## To be copied in the UI
# mod_country_selection_ui("country_selection_1")

## To be copied in the server
# mod_country_selection_server("country_selection_1")
