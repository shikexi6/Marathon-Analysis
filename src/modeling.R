library(tidyverse)

#' Create and fit linear regression model
#'
#' This function creates a simple linear regression model and fits it to the training data.
#'
#' @param training_data A data frame containing the training data.
#' @param formula A formula specifying the model.
#' @return A fitted model object.
#' @export
create_linear_model <- function(data, formula) {
  # Validate input data
  if (!inherits(data, "data.frame")) {
    stop("Input data must be a data frame.")
  }
  
  # Validate formula variables
  vars <- all.vars(formula)
  missing_vars <- vars[!vars %in% colnames(data)]
  if (length(missing_vars) > 0) {
    stop(paste("The following variables are missing from the data:", paste(missing_vars, collapse = ", ")))
  }
  
  # Create the recipe
  recipe <- recipes::recipe(formula, data = data)
  
  # Create the model specification
  model_spec <- parsnip::linear_reg() %>%
    parsnip::set_engine("lm") %>%
    parsnip::set_mode("regression")
  
  # Create the workflow and fit the model
  workflow <- workflows::workflow() %>%
    workflows::add_recipe(recipe) %>%
    workflows::add_model(model_spec) %>%
    parsnip::fit(data = data)
  
  return(workflow)
}
