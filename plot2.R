# plot2.R
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

# plot2: create png file of line chart identical to Rober Peng's: 
# 480x480, transparent background, black line, no main title
# no x-axis label, x-tick marks labeled "Thu", "Fri", and "Sat",
# y-axis labeled "Global Active Power (kilowatts)"

png(filename = "plot2.png", bg = "transparent",
    width = 480, height = 480, units = "px", restoreConsole = TRUE)
plot(powerData$Active,type="l",xlab="",ylab='Global Active Power (kilowatts)',xaxt="n")
axis(1, at=c(1,length(powerData$Active)/2+1,length(powerData$Active)),
     labels=c("Thu","Fri","Sat"))
dev.off()
