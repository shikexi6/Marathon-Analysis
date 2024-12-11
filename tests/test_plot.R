library(testthat)
library(parsnip)
library(workflows)
library(recipes)

library(here)
source(here::here("src/plot.R"))

# Sample data for testing
test_data <- data.frame(
  max = c(10, 20, 30, 40, 50),
  time_hrs = c(4.5, 4.0, 3.8, 3.6, 3.4)
)

# Test to check if the function returns a ggplot object
test_that("generate_scatterplot returns a ggplot object", {
  plot <- generate_scatterplot(
    data = test_data,
    x = "max",
    y = "time_hrs",
    output_path = tempfile(fileext = ".png") # Temporary file for saving the plot
  )
  expect_s3_class(plot, "ggplot")
})

# Test to check if the function saves the plot to the specified output path
test_that("generate_scatterplot saves plot to the output path", {
  output_path <- tempfile(fileext = ".png")
  generate_scatterplot(
    data = test_data,
    x = "max",
    y = "time_hrs",
    output_path = output_path
  )
  expect_true(file.exists(output_path)) # Check if the file exists
  unlink(output_path) # Cleanup after test
})