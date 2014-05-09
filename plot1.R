# plot1.R
# Exploratory Data Analysis - Assignment 1
# 
# Read in entire file, then subset rows for desired dates

# Make sure the data file is in your working directory

require("date")
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")

# subset Feb 1 and 2 2007, then remove larger dataset
powerData <- household_power_consumption[household_power_consumption$Date == "1/2/2007" |household_power_consumption$Date == "2/2/2007",]
rm(household_power_consumption)

# mutate Date and Global active power fields to "Date" and "numeric" respectively
powerData$Date <- as.character(powerData$Date) 
powerData$Date <- as.date(powerData$Date)
powerData$Active <- as.numeric(as.character(powerData$Global_active_power))

# plot1: create png file of histogram identical to Rober Peng's: 
# 480x480, transparent background, red bars, titled "Global Active Power"
# x-axis labeled "Global Active Power (kilowatts)", y-axis labeled "Frequency"

png(filename = "plot1.png", bg = "transparent",
    width = 480, height = 480, units = "px", restoreConsole = TRUE)
hist(powerData$Active, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
