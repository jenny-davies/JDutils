#' Read and union multiple CSV files
#'
#' @param filepath A relative or absolute filepath where the files to be combined are saved
#'
#' @return A dataframe containing the combined files
#' @export
#'
#' @examples
#' df <- read_and_union_files(filepath = "C:/User/Downloads/Files_to_combine")
read_and_union_files <- function(filepath) {
  files <- list.files(path = filepath,
                      pattern = ".csv",
                      full.names = TRUE)
  
  data <- do.call(rbind,
                  lapply(files, read.csv))
  
  return(data)
}