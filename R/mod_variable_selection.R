#' variable_selection UI Function
#'
#' @description A shiny Module.
#'
#' @param   id   Parameter to connect UI and server.
#' @param   label   Label for the input selector.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList

mod_variable_selection_ui <- function(id, label) {
  ns <- NS(id)
  tagList(
    mod_dynamic_selector_ui(ns("variable"), label, multiple = FALSE),
  )
}

#' variable_selection Server Functions
#'
#' @noRd
mod_variable_selection_server <- function(id, rx_dataset) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    selected_variable <- reactiveValues(
      name = NULL,
      label = NULL
    )

    all_numeric_vars <- reactive({
      get_numeric_colnames(rx_dataset())
    })

    var_choice_vector <- reactive({
      ds <- rx_dataset()
      stopifnot("colname_map" %in% names(attributes(ds)))
      colname_map <- attr(ds, "colname_map")
      choices <- colname_map[colname_map %in% all_numeric_vars()]
      choices
    })

    selected_variable_name <- mod_dynamic_selector_server(
      id = "variable",
      choices = var_choice_vector,
      selected = reactive(NULL)
    )

    observe({
      selected_variable$name <- selected_variable_name()
      selected_variable$label <- invert_names(var_choice_vector())[selected_variable_name()]
    }) |>
      bindEvent(selected_variable_name())

    return(
      selected_variable
    )
  })
}

## To be copied in the UI
# mod_variable_selection_ui("variable_selection_1")

## To be copied in the server
# mod_variable_selection_server("variable_selection_1")
