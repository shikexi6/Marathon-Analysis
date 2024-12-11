.PHONY: all clean

all: report/marathon_analysis.html report/marathon_analysis.pdf

# download and extract data
data/marathon.csv : scripts/download_data.R
	Rscript scripts/download_data.R \
		--url="https://raw.githubusercontent.com/UBC-DSCI/dsci-100-student/refs/heads/master/materials/R/worksheet_regression2/data/marathon.csv" \
		--write_to=data/

# perform eda and save plots
results/full_scatterplot_maxDistance_racetime.png results/subset_scatterplot_maxDistance_racetime.png : scripts/eda.R data/marathon.data.csv
	Rscript scripts/eda.R \
		--input_file=data/marathon.csv \
		--plot_to=results/

# train model
results/training_scatterplot.png results/training_prediction_plot.png results/test_prediction_plot.png: scripts/analysis.R data/marathon.csv
	Rscript scripts/analysis.R \
		--input_file=data/marathon.csv
		--plot-to=results/figures \
		--seed=2000

# build HTML report and copy build to docs folder
report/marathon_analysis.html report/marathon_analysis.pdf : 
	report/marathon_analysis.qmd \
	report/references.bib \
	results/training_scatterplot.png \
	results/training_prediction_plot.png \
	results/test_prediction_plot.png \
	results/full_scatterplot_maxDistance_racetime.png \
	results/subset_scatterplot_maxDistance_racetime.png
		quarto render report/marathon_analysis.qmd --to html
		quarto render report/marathon_analysis.qmd --to pdf

# clean up analysis
clean :
	rm -rf data/marathon.csv
	rm -f results/full_scatterplot_maxDistance_racetime.png results/subset_scatterplot_maxDistance_racetime.png
	rm -f results/training_scatterplot.png results/training_prediction_plot.png results/test_prediction_plot.png
	rm -rf report/marathon_analysis.html report/marathon_analysis.pdf