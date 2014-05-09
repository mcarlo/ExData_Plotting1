# plot3.R
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

# mutate sub_metering fields to "numeric"
powerData$sub1 <- as.numeric(as.character(powerData$Sub_metering_1))
powerData$sub2 <- as.numeric(as.character(powerData$Sub_metering_2))
powerData$sub3 <- as.numeric(as.character(powerData$Sub_metering_3))

# plot3: create png file of 3-color line chart identical to Rober Peng's: 
# 480x480, transparent background, black/blue/red for sub_metering 1/2/3,
# no main title, no x-axis label, x-tick marks labeled "Thu", "Fri", and "Sat",
# y-axis labeled "Energy sub metering", upper-right legend 

png(filename = "plot3.png", bg = "transparent",
    width = 480, height = 480, units = "px", restoreConsole = TRUE)
plot(powerData$sub1,type="l",xlab="",ylab='Energy sub metering',xaxt="n")
lines(powerData$sub2, col = "Red")
lines(powerData$sub3, col = "Blue")
axis(1, at=c(1,length(powerData$sub1)/2+1,length(powerData$sub1)),
     labels=c("Thu","Fri","Sat"))
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
