% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/run_and_capture_message.R
\name{run_and_capture_message}
\alias{run_and_capture_message}
\title{Run a function and capture messages}
\usage{
run_and_capture_message(function_call)
}
\arguments{
\item{function_call}{A function with parameters to be run}
}
\value{
A character vector
}
\description{
Run a function and capture messages
}
\examples{
message <- run_and_capture_message(
  function_call = {
    message("test")
  }
)
}
