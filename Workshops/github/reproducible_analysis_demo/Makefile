# Run all analysis
all: getdata analysis plot paper

# Clean outputs
clean:
	rm data/tasic_labels.tsv data/tasic_training_b2.txt \
	results/phate.csv results/phate_plot.png docs/manuscript/manuscript.pdf

# Get data
getdata:
	sh code/get_data.sh
	mv tasic_training_b2.txt tasic_labels.tsv data/

# Run analysis
analysis:
	python3 code/run_analysis.py

# Make figure
plot:
	Rscript code/visualize_results.r

# Write paper
paper: docs/manuscript/manuscript.pdf

docs/manuscript/manuscript.pdf: docs/manuscript/manuscript.Rmd \
	data/tasic_labels.tsv results/phate_plot.png
	Rscript -e "rmarkdown::render(input = '$<', output_format = 'rticles::plos_article')"

# Docker 	
build:
	docker build -t singha53/demo:v0.1 .

run:
	docker run --rm -it -p 8787:8787 -e PASSWORD=123 -v $(shell pwd):/home/rstudio/ singha53/demo:v0.1
	
push:
	docker push singha53/demo:v0.1