## Set the working directory
setwd("E:/Coursera/4_Exploratory Data Analysis/exdata-data-household_power_consumption")

## Read the data
power_consumption <- read.csv("household_power_consumption.txt", header = T, sep = ';',na.strings = "?", nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')

## Convert the Date variable to Date Class
power_consumption$Date <- as.Date(power_consumption$Date, format = "%d/%m/%Y")

## Subsetting the data within the date ranges
data <- subset(power_consumption, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Generating Plot 4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data, {
  plot(Global_active_power ~ Datetime, type = "l", 
       ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering",
       xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
  plot(Global_reactive_power ~ Datetime, type = "l", 
       ylab = "Global_rective_power", xlab = "datetime")
})

## Copy my plot to a PNG file
dev.copy(png, file = "plot4.png") 

## Closing PNG device
dev.off()
