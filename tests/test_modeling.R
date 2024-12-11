library(testthat)
library(parsnip)
library(workflows)
library(recipes)
library(here)
source(here::here("src/modeling.R"))

test_that("create_linear_model returns a valid workflow object", {
  data <- data.frame(max = c(10, 20, 30, 40), time_hrs = c(4.88, 4.66, 4.44, 4.22))
  model <- create_linear_model(data, time_hrs ~ max)
  
  # Ensure the returned object is a workflow
  expect_true(inherits(model, "workflow"))
  
  # Extract the fitted model and ensure it's an lm object
  fitted_model <- workflows::pull_workflow_fit(model)$fit
  expect_true(inherits(fitted_model, "lm"))
})

test_that("create_linear_model throws an error for invalid data", {
  data <- data.frame(max = c(10, 20, 30, 40))
  
  expect_error(create_linear_model(data, time_hrs ~ max), "missing")
  expect_error(create_linear_model(data, non_existent_column ~ max), "missing")
})

