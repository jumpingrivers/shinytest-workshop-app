#' country_selection UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_country_selection_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' country_selection Server Functions
#'
#' @noRd 
mod_country_selection_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_country_selection_ui("country_selection_1")
    
## To be copied in the server
# mod_country_selection_server("country_selection_1")
