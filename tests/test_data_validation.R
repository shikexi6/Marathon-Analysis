library(testthat)
library(here)
source(here::here("src/data_validation.R"))

test_that("validate_marathon_data removes duplicates and empty rows", {
  data <- data.frame(
    max = c(10, 10, NA),
    time_hrs = c(4, 4, NA)
  )
  validated_data <- validate_marathon_data(data)
  expect_equal(nrow(validated_data), 1)
})