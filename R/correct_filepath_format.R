#' Correct File Path Formats To Read Into R
#'
#' @param filepath A raw string giving a file path with directories separated using backslashes. It must be given as a raw string, for example: r"(path_to_file)".
#'
#' @returns A string giving a file path with backslashes converted to forward slashes
#' @export
#'
#' @examples
#' path <- correct_filepath_format(r"(top_directory\folder\sub-folder\file.txt)")
correct_filepath_format <- function(filepath) {
  filepath <- gsub("\\\\", "/", filepath)
  
  return(filepath)
}