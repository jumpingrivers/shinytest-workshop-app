#' invert_names - Swap the names and values in a named vector.
#'
#' @description A fct function
#'
#' @param   x   A named character vector. It should contain no duplicates.
#' @return   A named character vector. The names and values from the original vector are swapped.
#'
#' @noRd
invert_names <- function(x) {
  stopifnot(is.character(x))
  if (is.null(names(x))) {
    stop("`x` must contain names in `invert_names(x)`")
  }
  if(any(duplicated(x))) {
    stop("`x` must contain no duplicate values in `invert_names(x)`")
  }

  y <- names(x)
  names(y) <- x

  y
}
