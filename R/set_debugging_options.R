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
  options(error = function() {
    searcher::ai_prompt("debugging")
    searcher::ask_chatgpt()
  })
}
