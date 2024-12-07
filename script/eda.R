# author: Kexin Shi
#
# This script does exploratory data analysis.
#
# Usage: Rscript eda.R

# Load required libraries
library(tidyverse)
library(fs)
library(here)
library(tidymodels)
library(testthat)
library(knitr)


"This script prints out docopt args and the type of object they are stored as.
Usage: eda.R <input_file> <subset_scatterplot_maxDistance_racetime> <full_scatterplot_maxDistance_racetime>
Options:
<input_file>  Path to the input CSV file 
<subset_scatterplot_maxDistance_racetime>       Output PNG file for subset
<full_scatterplot_maxDistance_racetime>        Output PNG file for full set
" -> doc

args <- docopt(doc)

# Input arguments
input_file <- args$input_file
subset_output <- here(args$subset_scatterplot_maxDistance_racetime)
full_output <- here(args$full_scatterplot_maxDistance_racetime)

# Load data
data <- read_csv(input_file)

# EDA: Subset scatterplot
set.seed(2000)
subset_data <- data %>% sample_n(50)

subset_scatterplot <- ggplot(subset_data, aes(x = max, y = time_hrs)) +
  geom_point(alpha = 0.5) +
  xlab("Maximum Distance Ran per Week During Training (miles)") +
  ylab("Race Time (hours)") +
  theme(text = element_text(size = 20))

# Save subset scatterplot
ggsave(subset_output, plot = subset_scatterplot, width = 8, height = 6)

# EDA: Full dataset scatterplot
full_scatterplot <- ggplot(data, aes(x = max, y = time_hrs)) +
  geom_point(alpha = 0.5) +
  xlab("Maximum Distance Ran per Week During Training (miles)") +
  ylab("Race Time (hours)") +
  theme(text = element_text(size = 20))

# Save full dataset scatterplot
ggsave(full_output, plot = full_scatterplot, width = 8, height = 6)

message("EDA completed. Scatterplots saved to the specified output files.")