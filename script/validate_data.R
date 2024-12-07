# author: Kexin Shi
#
# This script validate data from downloaded data
#
# Usage: Rscript validate_data.R <input_file>

# Load required libraries
library(tidyverse)
library(fs)
library(here)
library(tidymodels)
library(testthat)
library(knitr)


"This script prints out docopt args and the type of object they are stored as.
Usage: Rscript validate_data.R <input_file>
Options:
<input_file>  Path to the input CSV file 
" -> doc

args <- docopt(doc)

# Load data
data <- tryCatch({
  read_csv2(args$input_file)
}, error = function(e) {
  stop("Error in reading input file: ", e$message)
})

# Validation
# Validation: Ensure the data file is in the correct format
if (!inherits(data, "data.frame")) {
  stop("The data file is not in the correct format. Expected a CSV to be read as a data frame.")
}

# Validation: Check for empty observations (rows with all NA values)
empty_rows <- apply(data, 1, function(row) all(is.na(row)))
if (any(empty_rows)) {
  warning("There are completely empty observations. Removing these rows.")
  data <- data[!empty_rows, ]
}

# Validation: Check for duplicate observations
if (any(duplicated(data))) {
  warning("There are duplicate observations. Removing them now.")
  data <- data[!duplicated(data), ]
}

message("Data validation complete. The dataset is clean and ready for analysis.")