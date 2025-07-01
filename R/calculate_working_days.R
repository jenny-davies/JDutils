#' Calculate number of working days in the UK by month and year
#'
#' @param start A date in the format "YYYY-MM-DD"
#' @param end A date in the format "YYYY-MM-DD"
#'
#' @return a data frame with the number of working days in each month and total for the year
#' @export
#'
#' @examples
#' calculate_working_days(start = "2024-01-01", end = "2024-12-31")
calculate_working_days <- function(start, end) {
  weekdays <- data.frame(dates = seq(lubridate::ymd(start), 
                                     lubridate::ymd(end), by = "day")) |> 
    dplyr::mutate(day = lubridate::wday(.data$dates, week_start = 1),
                  month_start = lubridate::floor_date(.data$dates, "month")) |> 
    dplyr::filter(!.data$day %in% c(6, 7)) |> 
    dplyr::group_by(.data$month_start) |> 
    dplyr::summarise(n_weekdays = dplyr::n_distinct(.data$dates))
  
  bank_holiday_list <- readLines("https://www.gov.uk/bank-holidays/england-and-wales.ics") |> 
    stringr::str_subset("^DTSTART") |> 
    stringr::str_extract_all("\\d+$") |> 
    lubridate::ymd()
  
  bank_holidays <- data.frame(bh_dates = bank_holiday_list) |> 
    dplyr::filter(.data$bh_dates >= start &
                    .data$bh_dates <= end) |> 
    dplyr::mutate(month_start = lubridate::floor_date(.data$bh_dates, "month")) |> 
    dplyr::group_by(.data$month_start) |> 
    dplyr::summarise(n_bankholidays = dplyr::n_distinct(.data$bh_dates))
  
  working_days <- weekdays |> 
    dplyr::left_join(bank_holidays, by = "month_start") |> 
    dplyr::mutate(n_bankholidays = ifelse(is.na(.data$n_bankholidays), 0, .data$n_bankholidays),
                  n_working_days = .data$n_weekdays - .data$n_bankholidays,
                  year_total = sum(.data$n_working_days)) |> 
    dplyr::select(.data$month_start, .data$n_working_days, .data$year_total)
  
  return(working_days)
}