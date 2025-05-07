#' Run a function and capture messages
#'
#' @param function_call A function with parameters to be run
#'
#' @returns A character vector
#' @export
#'
#' @examples
#' message <- run_and_capture_message(
#'   function_call = {
#'     message("test")
#'   }
#' )
run_and_capture_message <- function(function_call) {
  output_message <- NULL

  expr <- substitute(function_call)

  withCallingHandlers(
    eval(expr, envir = parent.frame()),
    message = function(m) {
      output_message <<- c(output_message, conditionMessage(m))
      invokeRestart("muffleMessage")
    }
  )

  return(output_message)
}
