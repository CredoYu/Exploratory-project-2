## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

library(ggplot2)

#Plot3
target_NEI  <- NEI[NEI$fips=="24510", ]
Emission_YearType <- aggregate(Emissions ~ year+type, target_NEI, sum)


png("plot3.png", width=640, height=480)
g <- ggplot(Emission_YearType, aes(year, Emissions, color = type))
g <- g + geom_line() + xlab("year") + ylab(expression('Total PM2.5 Emissions')) +
  ggtitle('Total Emissions in Baltimore City from 1999 to 2008')
print(g)
dev.off()