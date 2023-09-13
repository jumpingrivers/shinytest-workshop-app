#' extract_unique
#'
#' @description   A function that extracts the unique values within a column of a data-frame. The
#'   values are sorted before returning.
#'
#' @param   x   A data-frame.
#' @param   column   Scalar character. The name of a column in the data-frame.
#'
#' @return   A vector of unique values from `x[[column]]`, in sorted order.
#'
#' @noRd

extract_unique <- function(x, column) {
  sort(unique(x[[column]]))
}
