#' Stop Quietly i.e. Without Error Messages
#'
#' @returns Nothing - used to stop a process without an error message, where stopping is the desired behaviour of the program
#' @export
#'
#' @examples
#' \dontrun{
#' stop_quietly()
#' }
stop_quietly <- function() {
  op <- options(show.error.messages = FALSE)
  on.exit(options(op))
  stop()
}
