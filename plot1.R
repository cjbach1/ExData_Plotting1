## downloading the zip file to working directory, unzipping, and loading packages
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "C:/Users/Corey/Desktop/RStudio/4 - Exploratory Data Analysis/epc.zip")
unzip("C:/Users/Corey/Desktop/RStudio/4 - Exploratory Data Analysis/epc.zip")
library(dplyr)
library(data.table)

## reading data in and verifying
epc <- read.table("household_power_consumption.txt",nrows=2075259, sep = ";", header =TRUE, na.strings = "?",
                  colClasses = c("character", "character", "numeric","numeric","numeric","numeric",
                                 "numeric","numeric","numeric"), stringsAsFactors = FALSE)
head(epc)

## subsetting for only 1st and 2nd of February 2007 and verifying
epcplot <- epc[epc$Date %in% c("1/2/2007","2/2/2007"),]
head(epcplot)

## creating plot
hist(epcplot$Global_active_power, xlab="Global Active Power (kilowatts)",
     main="Global Active Power", col="red")

## saving plot to png
png(file="C:/Users/Corey/Desktop/RStudio/4 - Exploratory Data Analysis/ExData_Plotting1/plot1.png",
    height=480, width=480)
hist(epcplot$Global_active_power, xlab="Global Active Power (kilowatts)",
     main="Global Active Power", col="red")
dev.off()


