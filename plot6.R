## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}
# merge
if(!exists("NEI_SCC")){
  NEI_SCC <- merge(NEI, SCC, by="SCC")
}

library(ggplot2)

target_NEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

Emission_YearFlips <- aggregate(Emissions ~ year + fips, target_NEI, sum)
Emission_YearFlips$fips[Emission_YearFlips$fips=="24510"] <- "Baltimore, MD"
Emission_YearFlips$fips[Emission_YearFlips$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png", width=1040, height=480)
g <- ggplot(Emission_YearFlips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  + xlab("year") + ylab(expression('Total PM2.5 Emissions')) +
  ggtitle('Total Emissions from motor vehicle in Baltimore City, vs Los Angeles, CA  1999-2008')
print(g)
dev.off()