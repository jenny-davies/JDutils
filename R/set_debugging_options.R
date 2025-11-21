#' Set Debugging Options
#'
#' Set options to use the searcher package to automatically prompt ChatGPT with error messages using the "debugging" prompt.
#'
#' @returns Nothing, but sets options
#' @export
#'
#' @examples
#' set_debugging_options()
set_debugging_options <- function() {
  if (!requireNamespace("searcher", quietly = TRUE)) {
    warning("Package 'searcher' not installed; set_debugging_options will not be enabled.")
    return(invisible(NULL))
  }
  
  exports <- tryCatch(getNamespaceExports("searcher"), error = function(e) character(0))
  if (!all(c("ai_prompt", "ask_chatgpt") %in% exports)) {
    warning("searcher does not export ai_prompt and/or ask_chatgpt; set_debugging_options will not be enabled.")
    return(invisible(NULL))
  }
  
  ai_prompt <- getExportedValue("searcher", "ai_prompt")
  ask_chatgpt <- getExportedValue("searcher", "ask_chatgpt")
  
  if (!is.function(ai_prompt) || !is.function(ask_chatgpt)) {
    warning("searcher exported objects are not functions; set_debugging_options will not be enabled.")
    return(invisible(NULL))
  }
  
  options(error = function() {
    ai_prompt("debugging")
    ask_chatgpt()
  })
}
