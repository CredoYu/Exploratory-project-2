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

target_NEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
Emission_year <- aggregate(Emissions ~ year, target_NEI, sum)

#plot5
png("plot5.png", width=640, height=480)
g <- ggplot(Emission_year, aes(factor(year), Emissions, color = 'red', fill = 'red'))
g <- g + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM2.5 Emissions')) +
  ggtitle('Total Emissions from motor vehicle in Baltimore City from 1999 to 2008')
print(g)
dev.off()