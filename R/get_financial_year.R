#' Get financial year from date
#'
#' @param date A date, in the format "YYYY-MM-DD"
#'
#' @returns Financial year as a character
#' @export
#'
#' @examples
#' get_financial_year("2025-07-05")
get_financial_year <- function(date) {
  
  if (!grepl("^\\d{4}-\\d{2}-\\d{2}$", date)){
    stop('Please provide date in the format "YYYY-MM-DD"')
  }
  
  ifelse(lubridate::month(date)>3,
         paste0(lubridate::year(date), "/", 
                substr(lubridate::year(date)+1, start = 3, stop = 4)),
         paste0(lubridate::year(date)-1, "/", 
                substr(lubridate::year(date), start = 3, stop = 4)))
}