plot1 <- function(NEI = NULL, SCC = NULL) {
    	##Check if NEI (National Emission Inventory) 
	## and SCC (Source_Classification Code) datasets are passed
	if (is.null(NEI)) {
		stop("Please provide NEI datasets")	
	}

	if (is.null(SCC)) {
		stop("Please provide SCC datasets")
	}

	##get sum of pollution by year
	sum_pol_by_year <- tapply(NEI$Emissions, NEI$year, sum)

	##show data in bar plot
	barplot(sum_pol_by_year/10^6,
		ylab="Emission (10^6) tons",
		xlab="Year",
		names.arg=names(sum_pol_by_year),
		main="Total PM2.5 Emissions in the United States")

	## Saving plot into a png file
	dev.copy(png, "plot1.png")
	dev.off()
}