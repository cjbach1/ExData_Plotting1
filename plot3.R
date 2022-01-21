## downloading the zip file to working directory, unzipping, and loading packages
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "C:/Users/Corey/Desktop/RStudio/4 - Exploratory Data Analysis/epc.zip")
unzip("C:/Users/Corey/Desktop/RStudio/4 - Exploratory Data Analysis/epc.zip")
library(dplyr)
library(data.table)

## reading data in and verifying
epc <- read.table("household_power_consumption.txt",nrows=2075259, sep = ";", header =TRUE, na.strings = "?",
                  colClasses = c("numeric", "character", "numeric","numeric","numeric","numeric",
                                 "numeric","numeric","numeric"), stringsAsFactors = FALSE)
head(epc)

## subsetting for only 1st and 2nd of February 2007 and combining date+time into a new single column (and verifying)
epcplot2 <- epc[epc$Date %in% c("1/2/2007","2/2/2007"),]
epcplot2$Date <- as.Date(epcplot2$Date, format="%d/%m/%Y")
epcplot2$DateTime <- as.POSIXct(paste(as.Date(epcplot2$Date), epcplot2$Time))
tail(epcplot2)

## creating plot
plot(epcplot2$DateTime,epcplot2$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "", )
lines(epcplot2$DateTime,epcplot2$Sub_metering_2, col="red")
lines(epcplot2$DateTime,epcplot2$Sub_metering_3, col="blue")
legend("topright", lty=1,col = c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 


## saving plot to png
png(file="C:/Users/Corey/Desktop/RStudio/4 - Exploratory Data Analysis/ExData_Plotting1/plot3.png",
    height=480, width=480)
plot(epcplot2$DateTime,epcplot2$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "", )
lines(epcplot2$DateTime,epcplot2$Sub_metering_2, col="red")
lines(epcplot2$DateTime,epcplot2$Sub_metering_3, col="blue")
legend("topright", lty=1,col = c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
dev.off()
