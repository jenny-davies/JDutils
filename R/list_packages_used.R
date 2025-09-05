#' List R Packages Used In A Project
#'
#' @returns A list of R packages used in the current working project in alphabetical order, printed to the console.
#' @export
#'
#' @examples
#' list_packages_used()
list_packages_used <- function() {
  sort(unique(renv::dependencies()$Package))
}
