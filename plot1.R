setwd("D:/R/NEI_data")
## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
  NEI <- readRDS("./summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./Source_Classification_Code.rds")
}

#Plot 1
Emission_year <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot(height=Emission_year$Emissions, names.arg=Emission_year$year, xlab="years", ylab=expression('log total PM2.5 emission'),main=expression('log PM2.5 emissions at years'))
dev.off()