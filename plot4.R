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

#Coal Match
coalMatches  <- grepl("coal", NEI_SCC$Short.Name, ignore.case=TRUE)
target_NEISCC <- NEI_SCC[coalMatches, ]

Emission_year <- aggregate(Emissions ~ year, target_NEISCC, sum)

#plot4
png("plot4.png", width=640, height=480)
g <- ggplot(Emission_year, aes(factor(year), Emissions, color='red', fill = 'red'))
g <- g + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM Emissions')) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()
