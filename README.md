
<!-- README.md is generated from README.Rmd. Please edit that file -->

# JDutils

<!-- badges: start -->

[![R-CMD-check](https://github.com/jenny-davies/JDutils/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jenny-davies/JDutils/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

A collection of useful functions for small but frequent tasks.

## Functions

`create_filename`: given an export location and filename, check if there
are any existing files with the same name in the same location and
append a suffix to the end of the filename to avoid overwriting existing
files.

`generate_temporary_name`: generate a random string after “temp\_”.

`get_financial_year`: derive the financial year from a date in the
format “YYYY-MM-DD”.

`run_and_capture_message`: run a chunk of code and capture any messages
created into a new variable.

`calculate_working_days`: calculate the number of working days in a
year, including the number of working days in each month and the year’s
total.

`read_and_union_files`: read in and union CSV files in the same format
into a single data frame.

`%notin%`: negate the `%in%` function for easier filtering.

`list_packages_used`: list the packages used in the active R project.

`correct_filepath_format`: convert a filepath with folders separated by
backslashes into a filepath with forward slashes which can be read into
R.

`set_debugging_options`: set options so any error messages are
automatically used as prompts for ChatGPT via the `searcher` package,
with the “debugging” prompt used/

## Installation

You can install the development version of JDutils from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("https://github.com/jenny-davies/JDutils")
```
