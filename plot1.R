# Exploratory Data Analysis - Assignment 1

setwd("~/GitHub/ExData_Plotting1")

require("date")
household_power_consumption <- read.csv("~/GitHub/ExData_Plotting1/household_power_consumption.txt", sep=";")

powerData <- household_power_consumption[household_power_consumption$Date == "1/2/2007" |household_power_consumption$Date == "2/2/2007",]
rm(household_power_consumption)

powerData$Date <- as.character(powerData$Date) 
powerData$Date <- as.date(powerData$Date)
powerData$Active <- as.numeric(as.character(powerData$Global_active_power))

hist(powerData$Active, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

png(filename = "plot1.png", bg = "transparent",
    width = 480, height = 480, units = "px", restoreConsole = TRUE)
hist(powerData$Active, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
