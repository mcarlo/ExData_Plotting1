# Exploratory Data Analysis - Assignment 1

setwd("~/GitHub/ExData_Plotting1")
#rm(powerData)
household_power_consumption <- read.csv("~/GitHub/ExData_Plotting1/household_power_consumption.txt", sep=";")

powerData <- household_power_consumption[household_power_consumption$Date == "1/2/2007" |household_power_consumption$Date == "2/2/2007",]
rm(household_power_consumption)

str(powerData)
powerData$Date <- as.character(powerData$Date) #, format = "%m/%d%Y")
str(powerData)
powerData$Date <- as.date(powerData$Date)
#summary(powerData$Date)
head(powerData)
summary(powerData)
powerData$Active <- as.numeric(as.character(powerData$Global_active_power))
powerData$sub1 <- as.numeric(as.character(powerData$Sub_metering_1))
powerData$sub2 <- as.numeric(as.character(powerData$Sub_metering_2))
powerData$sub3 <- as.numeric(as.character(powerData$Sub_metering_3))
powerData$volt <- as.numeric(as.character(powerData$Voltage))
powerData$react <- as.numeric(as.character(powerData$Global_reactive_power))

summary(powerData$Active)
hist(powerData$Active, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

png(filename = "plot1.png", bg = "transparent",
    width = 480, height = 480, units = "px", restoreConsole = TRUE)
hist(powerData$Active, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

png(filename = "plot2.png", bg = "transparent",
    width = 480, height = 480, units = "px", restoreConsole = TRUE)
plot(powerData$Active,type="l",xlab="",ylab='Global Active Power (kilowatts)',xaxt="n")
axis(1, at=c(1,length(powerData$Active)/2+1,length(powerData$Active)),
     labels=c("Thu","Fri","Sat"))
dev.off()

png(filename = "plot3.png", bg = "transparent",
    width = 480, height = 480, units = "px", restoreConsole = TRUE)
plot(powerData$sub1,type="l",xlab="",ylab='Energy sub metering',xaxt="n")
lines(powerData$sub2, col = "Red")
lines(powerData$sub3, col = "Blue")
axis(1, at=c(1,length(powerData$sub1)/2+1,length(powerData$sub1)),
     labels=c("Thu","Fri","Sat"))
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

png(filename = "plot4.png", bg = "transparent",
    width = 480, height = 480, units = "px", restoreConsole = TRUE)
par(mfrow = c(2, 2))
plot(powerData$Active,type="l",xlab="",ylab='Global Active Power (kilowatts)',xaxt="n")
axis(1, at=c(1,length(powerData$Active)/2+1,length(powerData$Active)),
     labels=c("Thu","Fri","Sat"))

plot(powerData$volt,type="l",xlab="datetime",ylab='Voltage',xaxt="n")
axis(1, at=c(1,length(powerData$volt)/2+1,length(powerData$volt)),
     labels=c("Thu","Fri","Sat"))

plot(powerData$sub1,type="l",xlab="",ylab='Energy sub metering',xaxt="n")
lines(powerData$sub2, col = "Red")
lines(powerData$sub3, col = "Blue")
axis(1, at=c(1,length(powerData$sub1)/2+1,length(powerData$sub1)),
     labels=c("Thu","Fri","Sat"))
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")

plot(powerData$react,type="l",xlab="datetime",ylab='Global_reactive_power',xaxt="n")
axis(1, at=c(1,length(powerData$react)/2+1,length(powerData$react)),
     labels=c("Thu","Fri","Sat"))
par(mfrow = c(1,1))
dev.off()


axis(1, at=c(1,length(Freq)/2+1,length(Freq)),
     labels=c("Thu","Fri","Sat"))

axis(1, at=c(1,length(Freq)/2+1,length(Freq)),
     labels=c("Thu","Fri","Sat"))
