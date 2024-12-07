# author: Kexin Shi
#
# This script downloads the data and saves it locally.
#
# Usage: Rscript download_data.R <url> <output_file>

# Load required libraries
library(tidyverse)
library(fs)
library(here)
library(tidymodels)
library(testthat)
library(knitr)

"This script prints out docopt args and the type of object they are stored as.
Usage: download_data.R <url> <output_file>
Options:
<url>  URL of the CSV file to download 
<output_file>  Name of the output file to save in data/
" -> doc

# Parse the command-line arguments
args <- docopt(doc)


# Input arguments
url <- args$url
output_file <- here("data", args$output_file)

# Ensure the data directory exists
if (!dir_exists(here("data"))) {
  dir_create(here("data"))
}

# Download the data
if (!file_exists(output_file)) {
  message("Downloading data from URL...")
  tryCatch({
    data <- read_csv(url)
    write_csv(data, output_file)
    message("Data successfully downloaded and saved to: ", output_file)
  }, error = function(e) {
    stop("Failed to download or save data. Error: ", e$message)
  })
} else {
  message("File already exists at: ", output_file)
}

