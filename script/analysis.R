# author: Kexin Shi
#
# This script does linear regression analysis
#
# Usage: Rscript analysis.R

# Load required libraries
library(tidyverse)
library(fs)
library(here)
library(tidymodels)
library(testthat)
library(knitr)


"This script prints out docopt args and the type of object they are stored as.
Usage: eda.R <input_file> <lm_coefficients>
Options:
<input_file>           Path to the input CSV file 
<training_scatterplot> Output PNG file for training scatterplot
<training_prediction_plot> Output PNG file for training prediction plot
<test_prediction_plot> Output PNG file for test prediction plot
" -> doc

# Parse command-line arguments
args <- docopt(doc)

# Input arguments
input_file <- args$input_file
training_output <- here(args$training_scatterplot)
lm_model_training_plot <- here(args$training_prediction_plot)
lm_model_test_plot <- here(args$test_prediction_plot)

# Load data
marathon <- read_csv(input_file)

# Split data into training and testing datasets
set.seed(2000)
marathon_split <- rsample::initial_split(marathon, prop = 0.75, strata = time_hrs)
marathon_training <- rsample::training(marathon_split)
marathon_testing <- rsample::testing(marathon_split)

# Scatterplot of training data
training_scatterplot <- marathon_training |>
  ggplot(aes(x = max, y = time_hrs)) +
  geom_point(alpha = 0.25, size = 2) +
  xlab("Maximum Distance Ran per \n Week During Training (miles)") +
  ylab("Race Time (hours)") +
  theme(text = element_text(size = 20))

ggsave(training_output, plot = training_scatterplot, width = 8, height = 6)
# Linear regression model specification
lm_spec <- parsnip::linear_reg() |>
  parsnip::set_engine("lm") |>
  parsnip::set_mode("regression")

# Recipe, workflow, and model fitting
lm_recipe <- recipes::recipe(time_hrs ~ max, data = marathon_training)

lm_fit <- workflows::workflow() |>
  workflows::add_recipe(lm_recipe) |>
  workflows::add_model(lm_spec) |>
  parsnip::fit(data = marathon_training)

# Predictions and scatterplot with fitted line
marathon_preds <- lm_fit |>
  predict(marathon_training) |>
  bind_cols(marathon_training)

training_prediction_plot <- marathon_preds |>
  ggplot(aes(x = max, y = time_hrs)) +
  geom_point(alpha = 0.4) +
  geom_line(
    mapping = aes(x = max, y = .pred), 
    color = "blue") +
  xlab("Maximum Distance Ran per \n Week During Training (mi)") +
  ylab("Race Time (hours)") +
  theme(text = element_text(size = 20))

ggsave(lm_model_training_plot, plot = training_prediction_plot, width = 8, height = 6)
# Model performance on test data
lm_test_results <- lm_fit |>
  predict(marathon_testing) |>
  bind_cols(marathon_testing) |>
  yardstick::metrics(truth = time_hrs, estimate = .pred)

# RMSPE calculation
lm_rmspe <- lm_test_results |>
  filter(.metric == "rmse") |>
  pull(.estimate)

# Prediction plot on test data
test_preds <- lm_fit |>
  predict(marathon_testing) |>
  bind_cols(marathon_testing)

test_prediction_plot <- test_preds |>
  ggplot(aes(x = max, y = time_hrs)) +
  geom_point(alpha = 0.4) +
  geom_line(
    mapping = aes(x = max, y = .pred), 
    color = "blue") +
  xlab("Maximum Distance Ran per \n Week During Training (mi)") +
  ylab("Race Time (hours)") +
  theme(text = element_text(size = 20))

ggsave(lm_model_test_plot, plot = test_prediction_plot, width = 8, height = 6)
# Extract model coefficients
lm_coefficients <- broom::tidy(lm_fit)
kable(lm_coefficients)

# Output summary
message("Linear regression analysis complete.")