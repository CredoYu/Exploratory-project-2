## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

#Plot 2
target_NEI  <- NEI[NEI$fips=="24510", ]
Emission_year <- aggregate(Emissions ~ year, target_NEI, sum)
png('plot2.png')
barplot(height=Emission_year$Emissions, names.arg=Emission_year$year, xlab="years", ylab=expression('total PM2.5 emission'),main=expression('Total PM2.5 in the Baltimore City at various years'))
dev.off()