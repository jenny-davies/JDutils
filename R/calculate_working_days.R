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
calculate_working_days <- function(start = year_start,
                                   end = year_end) {
  weekdays <- data.frame(dates = seq(lubridate::ymd(start), 
                                     lubridate::ymd(end), by = "day")) |> 
    dplyr::mutate(day = lubridate::wday(dates, week_start = 1),
                  month_start = lubridate::floor_date(dates, "month")) |> 
    dplyr::filter(!day %in% c(6, 7)) |> 
    dplyr::group_by(month_start) |> 
    dplyr::summarise(n_weekdays = dplyr::n_distinct(dates))
  
  bank_holiday_list <- readLines("https://www.gov.uk/bank-holidays/england-and-wales.ics") |> 
    stringr::str_subset("^DTSTART") |> 
    stringr::str_extract_all("\\d+$") |> 
    lubridate::ymd()
  
  bank_holidays <- data.frame(bh_dates = bank_holiday_list) |> 
    dplyr::filter(bh_dates >= start &
                    bh_dates <= end) |> 
    dplyr::mutate(month_start = lubridate::floor_date(bh_dates, "month")) |> 
    dplyr::group_by(month_start) |> 
    dplyr::summarise(n_bankholidays = dplyr::n_distinct(bh_dates))
  
  working_days <- weekdays |> 
    dplyr::left_join(bank_holidays, by = "month_start") |> 
    dplyr::mutate(n_bankholidays = ifelse(is.na(n_bankholidays), 0, n_bankholidays),
                  n_working_days = n_weekdays - n_bankholidays,
                  year_total = sum(n_working_days)) |> 
    dplyr::select(month_start, n_working_days, year_total)
  
  return(working_days)
}