#' Cleans the column-names for a dataset using `janitor::clean_names` and stores the mapping between
#' the old and new column-names as an attribute.
#'
#' @param   x   A data-frame.
#' @param   ...   Additional arguments, passed onto `janitor::clean_names`.
#'
#' @return   The same data-frame, but with the column names cleaned and an additional attribute
#' added. The attribute `colname_map` is a named vector containing a mapping between the new (the
#' names) and old (the values) column names in the data-frame.

clean_names2 <- function(x, ...) {
  cleaned <- janitor::clean_names(x, ...)

  colname_map <- colnames(x)
  names(colname_map) <- colnames(cleaned)
  attr(cleaned, "colname_map") <- colname_map

  cleaned
}
