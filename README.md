# Marathon Analysis

- author: Kexin (Coco) Shi

## Summary

Over the last ten years, marathon running has become a popular physical activity around the world. This study aims to investigate the relationship between marathon runners' maximum distance ran per week during race training and their race time. We modeled a simple linear regression to predict marathon times based on their training patterns and tested on the model with the test dataset. By having this analysis, it helps marathon lovers to gain insights into how training volume influences race performance and to better prepare the race. Our final model performed moderate on the unseen test data set, with the RMSPE of 0.5504829, This means that, our simple linear regression model's predictions deviate from the actual race times by approximately 0.55 hours on average.However, there are several limitations of the model that there is only one predictor in the model, which may be not sufficient to make prediction.

This study uses the dataset from a a public dataset on GitHub, containing 13 variables about runners, such as age, bmi, maximum training distance per week (max, in miles) and actual marathon race time (time_hrs, in hours) and so on.

## Report

The final report can be found
[here](https://github.com/shikexi6/marathon-analysis/blob/main/marathon_analysis.qmd).


## Usage

### Setup

> If you are using Windows or Mac, make sure Docker Desktop is running.

1. Clone this GitHub repository.

### Running the analysis

1. Navigate to the root of this project on your computer using the
   command line and enter the following command:

``` 
docker compose up
```

2. In the terminal, look for a URL that starts with 
`http://127.0.0.1:8888/lab?token=` 
(for an example, see the highlighted text in the terminal below). 
Copy and paste that URL into your browser.

<img src="img/jupyter-container-web-app-launch-url.png" width=400>

3. To run the analysis,
open [`marathon.qmd`](https://github.com/shikexi6/marathon-analysis/blob/main/marathon_analysis.qmd) in Jupyter Lab you just launched
and under the "Kernel" menu click "Restart Kernel and Run All Cells...".

### Clean up

1. To shut down the container and clean up the resources, 
type `Cntrl` + `C` in the terminal
where you launched the container, and then type `docker compose rm`

## Dependencies

The following dependencies are required to run the analysis:

- R version 4.2 or later

- tidyverse: for data manipulation and visualization

- fs: for working with the filesystem

- here: for easy path management

- tidymodels: for modeling and machine learning

- broom: for summarizing model outputs

- yardstick: for evaluating model performance

- [Docker](https://www.docker.com/) 

- [VS Code](https://code.visualstudio.com/download)

- [VS Code Jupyter Extension](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter)

## Developer notes

### Developer dependencies
- `conda` (version 23.9.0 or higher)
- `conda-lock` (version 2.5.7 or higher)

### Adding a new dependency

1. Add the dependency to the `environment.yml` file on a new branch.

2. Run `conda-lock -k explicit --file environment.yml -p linux-64` to update the `conda-linux-64.lock` file.

2. Re-build the Docker image locally to ensure it builds and runs properly by running `docker build --platform linux/amd64 --tag shikexi6/marathon-analysis .`

3. Push the changes to GitHub. A new Docker
   image will be built and pushed to Docker Hub automatically.
   It will be tagged with the SHA for the commit that changed the file.

4. Update the `docker-compose.yml` file on your branch to use the new
   container image (make sure to update the tag specifically).

5. Send a pull request to merge the changes into the `main` branch. 

## License

This project is licensed under the following:

Code License: MIT License

Report License: Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)

See [the license file](LICENSE.md) for more information. . If
re-using/re-mixing please provide attribution and link to this webpage.
The software code contained within this repository is licensed under the
MIT license. See [the license file](LICENSE.md) for more information.
