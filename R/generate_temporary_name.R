#' Generate a random name
#'
#' @returns A character vector starting "temp_" and followed by a random set of characters
#' @export
#'
#' @examples
#' new_name <- generate_temporary_name()
generate_temporary_name <- function() {
  paste0("temp_",
         stringi::stri_rand_strings(1,10))
}
