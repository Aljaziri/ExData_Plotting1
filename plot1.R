## Set Working directory to my directory:
## setwd("C:/Users/jalil/Downloads/Data Science/04 Explore/Course Project 1")

## load all dataset
data_all <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

## Subset data
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## unload data from memory
rm(data_all)

## format dates
data$Datetime <- as.POSIXct(paste( as.Date (data$Date), data$Time ))

## Ploting
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
