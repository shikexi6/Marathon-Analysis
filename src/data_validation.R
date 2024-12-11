library(testthat)
library(tidyverse)

#' Validate marathon data
#'
#' This function validates the marathon data by checking for:
#' - Correct data format
#' - Empty rows
#' - Duplicate rows
#'
#' @param data A data frame containing the marathon data.
#' @return A validated data frame with duplicates and empty rows removed.
#' @export
validate_marathon_data <- function(data) {
  if (!inherits(data, "data.frame")) {
    stop("The data file is not in the correct format. Expected a data frame.")
  }
  
  empty_rows <- apply(data, 1, function(row) all(is.na(row)))
  if (any(empty_rows)) {
    warning("There are completely empty observations. Removing these rows.")
    data <- data[!empty_rows, ]
  }
  
  if (any(duplicated(data))) {
    warning("There are duplicate observations. Removing them now.")
    data <- data[!duplicated(data), ]
  }
  
  return(data)
}