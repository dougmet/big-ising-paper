
COMMIT := $(shell git rev-parse HEAD)
BRANCH := $(shell git rev-parse --symbolic-full-name --abbrev-ref HEAD)
TEX=pdflatex
TEXFLAGS=-interaction=batchmode
FIGS=fig-*.pdf

all: paper.pdf

# A filtered dataset that's much smaller
data/clusters_filter10.csv: data/clusters.csv scripts/cluster_filter.sh 
	@echo "Filtering clusters data"
	scripts/cluster_filter.sh data/clusters.csv data/clusters_filter10.csv

data/clusters_hist_100.csv: data/clusters_filter10.csv scripts/clusters_hist.R
	@echo "Building clusters histogram"
	Rscript scripts/cluster_hist.R

fig-density.pdf: scripts/density_plot.R data/em.csv
	Rscript scripts/density_plot.R

fig-clusters.pdf: scripts/cluster_plot.R data/clusters_hist_100.csv
	Rscript scripts/cluster_plot.R

paper.pdf: paper.tex $(FIGS) data/swolff0000.png
	@echo "Builing paper"
	$(TEX) $(TEXFLAGS) paper.tex

