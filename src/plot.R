library(tidyverse)
#' Generate scatterplot
#'
#' This function generates a scatterplot for the given x and y variables.
#'
#' @param data A data frame containing the data to plot.
#' @param x The name of the x-axis variable.
#' @param y The name of the y-axis variable.
#' @param output_path The file path to save the plot.
#' @return The ggplot object.
#' @export
generate_scatterplot <- function(data, x, y, output_path) {
  plot <- data |>
    ggplot(aes(x = .data[[x]], y = .data[[y]])) +
    geom_point(alpha = 0.5) +
    xlab(paste0("Maximum Distance Ran per Week (", x, ")")) +
    ylab(paste0("Race Time (", y, ")")) +
    theme_minimal()
  
  ggsave(output_path, plot)
  return(plot)
}
