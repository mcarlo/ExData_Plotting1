# plot4.R
# Exploratory Data Analysis - Assignment 1
# 
# Read in entire file, then subset rows for desired dates
require("date")
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")

# subset Feb 1 and 2 2007, then remove larger dataset
powerData <- household_power_consumption[household_power_consumption$Date == "1/2/2007" |household_power_consumption$Date == "2/2/2007",]
rm(household_power_consumption)

# mutate Date and power fields to "Date" and "numeric" respectively
powerData$Date <- as.character(powerData$Date) 
powerData$Date <- as.date(powerData$Date)
powerData$Active <- as.numeric(as.character(powerData$Global_active_power))
powerData$react <- as.numeric(as.character(powerData$Global_reactive_power))

# mutate sub_metering and voltage fields to "numeric"
powerData$sub1 <- as.numeric(as.character(powerData$Sub_metering_1))
powerData$sub2 <- as.numeric(as.character(powerData$Sub_metering_2))
powerData$sub3 <- as.numeric(as.character(powerData$Sub_metering_3))
powerData$volt <- as.numeric(as.character(powerData$Voltage))

# plot4: create png file of 4 charts: 
# upper left: same as plot2
# upper right: simple black line chart of voltage
# lower left: same as plot3
# lower right: simple black line chart of global reactive power

png(filename = "plot4.png", bg = "transparent",
    width = 480, height = 480, units = "px", restoreConsole = TRUE)

# set graphics parameters to 2 rows, 2 columns
par(mfrow = c(2, 2))

# first chart, same as plot2
plot(powerData$Active,type="l",xlab="",ylab='Global Active Power (kilowatts)',xaxt="n")
axis(1, at=c(1,length(powerData$Active)/2+1,length(powerData$Active)),
     labels=c("Thu","Fri","Sat"))

# second chart, voltage
plot(powerData$volt,type="l",xlab="datetime",ylab='Voltage',xaxt="n")
axis(1, at=c(1,length(powerData$volt)/2+1,length(powerData$volt)),
     labels=c("Thu","Fri","Sat"))

# third chart, same as plot3
plot(powerData$sub1,type="l",xlab="",ylab='Energy sub metering',xaxt="n")
lines(powerData$sub2, col = "Red")
lines(powerData$sub3, col = "Blue")
axis(1, at=c(1,length(powerData$sub1)/2+1,length(powerData$sub1)),
     labels=c("Thu","Fri","Sat"))
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")

# fourth chart, global reactive power
plot(powerData$react,type="l",xlab="datetime",ylab='Global_reactive_power',xaxt="n")
axis(1, at=c(1,length(powerData$react)/2+1,length(powerData$react)),
     labels=c("Thu","Fri","Sat"))
par(mfrow = c(1,1))
dev.off()
