#' Negate %in% For Filtering
#'
#' @param a a vector to be filtered
#' @param b a vector of values to use in the filter
#'
#' @returns TRUE or FALSE
#' @export
#'
#' @examples
#' df <- data.frame(col1 = c("x", "y", "z"))
#' 
#' dplyr::filter(df, col1 %notin% c("x", "y"))
`%notin%` <- function(a, b) {
  !(a %in% b)
}