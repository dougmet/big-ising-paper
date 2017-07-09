
COMMIT := $(shell git rev-parse HEAD)
BRANCH := $(shell git rev-parse --symbolic-full-name --abbrev-ref HEAD)
TEX=pdflatex
FIGS=fig-*.pdf

all: paper

git:
	echo commit is $(COMMIT), branch is $(BRANCH)

paper: paper.tex $(FIGS) data/swolff0000.png
	$(TEX) paper.tex ising64.cpp $(CFLAGS) $(LDFLAGS) -o 

fig-density: scripts/density_plot.R data/em.csv
	Rscript scripts/density_plot.R

fig-clusters: scripts/cluster_plot.R data/clusters_hist_100.csv
	Rscript scripts/cluster_plot.R

