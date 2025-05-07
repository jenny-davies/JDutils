#' Create a new filename to avoid overwriting existing files
#'
#' @param export_location A filepath to the location the new file should be written to
#' @param filepath The name and extension of the new file
#'
#' @returns A character vector giving a new filename with a counter appended to avoid overwriting any existing files
#' @export
#'
#' @examples
#' create_filename(export_location = "C:/Documents", filepath = "new_doc.txt")
create_filename <- function(export_location, filepath) {

  temp_filepath <- paste0(export_location, filepath)

  name <- tools::file_path_sans_ext(basename(temp_filepath))

  ext <- tools::file_ext(temp_filepath)

  existing_files <- list.files(export_location) |>
    stringr::str_subset(name)

  n_files <- length(existing_files)

  counter <- n_files + 1

  new_filepath <- file.path(
    paste0(export_location, "/", name, "_", counter, ".", ext)
  )

  return(new_filepath)
}
