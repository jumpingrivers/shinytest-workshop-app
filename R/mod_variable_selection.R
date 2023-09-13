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
    selectInput(
      inputId = ns("selected_variable"),
      label = label,
      choices = NULL,
      multiple = FALSE
    )
  )
}

#' variable_selection Server Functions
#'
#' @noRd
mod_variable_selection_server <- function(id, rx_dataset) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    all_numeric_vars <- reactive({
      rx_dataset() |>
        dplyr::select_if(is.numeric) |>
        colnames()
    })

    var_choice_vector <- reactive({
      ds <- rx_dataset()
      stopifnot("colname_map" %in% names(attributes(ds)))
      colname_map <- attr(ds, "colname_map")
      choices <- colname_map[colname_map %in% all_numeric_vars()]
      choices
    })

    observe({
      updateSelectInput(
        session = session,
        inputId = "selected_variable",
        choices = var_choice_vector(),
        selected = NULL
      )
    })

    return(
      reactive(input$selected_variable)
    )
  })
}

## To be copied in the UI
# mod_variable_selection_ui("variable_selection_1")

## To be copied in the server
# mod_variable_selection_server("variable_selection_1")
