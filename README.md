# Marathon Analysis

- author: Kexin (Coco) Shi

## Summary

Over the last ten years, marathon running has become a popular physical activity around the world. This study aims to investigate the relationship between marathon runners' maximum distance ran per week during race training and their race time. We modeled a simple linear regression to predict marathon times based on their training patterns and tested on the model with the test dataset. By having this analysis, it helps marathon lovers to gain insights into how training volume influences race performance and to better prepare the race. Our final model performed moderate on the unseen test data set, with the RMSPE of 0.5504829, This means that, our simple linear regression model's predictions deviate from the actual race times by approximately 0.55 hours on average.However, there are several limitations of the model that there is only one predictor in the model, which may be not sufficient to make prediction.

This study uses the dataset from a a public dataset on GitHub, containing 13 variables about runners, such as age, bmi, maximum training distance per week (max, in miles) and actual marathon race time (time_hrs, in hours) and so on.

## Report

The final report can be found
[here](https://github.com/shikexi6/marathon-analysis/blob/main/marathon_analysis.qmd).


## Usage

Follow the instructions below to reproduce the analysis.

1. Clone this GitHub repository.

2. Open the [`marathon-analysis.Rproj`](https://github.com/shikexi6/marathon-analysis/blob/main/marathon-analysis.Rproj) in RStudio

3. Restore the computational environment by running in the console:

```
renv::restore()
```

4. Open the [`marathon.qmd`](https://github.com/shikexi6/marathon-analysis/blob/main/marathon_analysis.qmd) file in RStudio.

5. Render the document to view the results by clicking the Render button or running:

```
quarto::quarto_render("marathon.qmd")
```
## Dependencies

The following dependencies are required to run the analysis:

- R version 4.2 or later

- tidyverse: for data manipulation and visualization

- fs: for working with the filesystem

- here: for easy path management

- tidymodels: for modeling and machine learning

- broom: for summarizing model outputs

- yardstick: for evaluating model performance

All dependencies are managed using renv and will be installed automatically when you run 
```
renv::restore()
```

## License

This project is licensed under the following:

Code License: MIT License

Report License: Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)

See [the license file](LICENSE.md) for more information. . If
re-using/re-mixing please provide attribution and link to this webpage.
The software code contained within this repository is licensed under the
MIT license. See [the license file](LICENSE.md) for more information.
