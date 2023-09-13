#' dynamic_selector UI Function
#'
#' @description A selectInput that is populated with choices / selected from the server.
#'
#' @param   id   Internal parameters for {shiny}.
#' @param   label   Label for the inputSelector.
#' @param   multiple   Are multiple selections allowed?
#'
#' @noRd
#'
#' @importFrom shiny NS tagList

mod_dynamic_selector_ui <- function(id,
                                    label,
                                    multiple = FALSE) {
  ns <- NS(id)
  tagList(
    selectInput(
      inputId = ns("user_selected"),
      label = label,
      choices = NULL,
      multiple = multiple
    )
  )
}

#' dynamic_selector Server Functions
#'
#' @noRd
mod_dynamic_selector_server <- function(id,
                                        choices,
                                        selected) {
  stopifnot(is.reactive(choices))
  stopifnot(is.reactive(selected))

  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    observe({
      updateSelectInput(
        session = session,
        inputId = "user_selected",
        choices = choices(),
        selected = selected()
      )
    })

    return(
      reactive(input$user_selected)
    )
  })
}

## To be copied in the UI
# mod_dynamic_selector_ui("dynamic_selector_1")

## To be copied in the server
# mod_dynamic_selector_server("dynamic_selector_1")
