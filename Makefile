report: R/report.Rmd figs/graphs.png
	cd R; Rscript -e "rmarkdown::render('report.Rmd', output_file = '../output/report.html')"

figs/graphs.png: R/graphs.R
	Rscript R/graphs.R



