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
 with(data, {
   plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
 })
 legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()