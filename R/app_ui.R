#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  bslib::page_sidebar(
    golem_add_external_resources(),
    title = "UN Statistics",
    sidebar = mod_sidebar_ui("sidebar"),
    mod_plots_ui("plot"),
    theme = bslib::bs_theme(
      bootswatch = "sandstone"
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "unstats"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
