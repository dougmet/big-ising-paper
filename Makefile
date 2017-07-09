
COMMIT := $(shell git rev-parse HEAD)
BRANCH := $(shell git rev-parse --symbolic-full-name --abbrev-ref HEAD)
TEX=pdflatex
FIGS=fig-*.pdf

all: paper.pdf

data/clusters_hist_100.csv: data/clusters.csv scripts/clusters_hist.R
	Rscript scripts/cluster_hist.R

fig-density.pdf: scripts/density_plot.R data/em.csv
	Rscript scripts/density_plot.R

fig-clusters.pdf: scripts/cluster_plot.R data/clusters_hist_100.csv
	Rscript scripts/cluster_plot.R

paper.pdf: paper.tex $(FIGS) data/swolff0000.png
	$(TEX) paper.tex ising64.cpp $(CFLAGS) $(LDFLAGS) -o 

