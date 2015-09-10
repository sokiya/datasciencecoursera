
## Set the working directory
setwd("E:/Coursera/4_Exploratory Data Analysis/exdata-data-household_power_consumption")

## Read the data
power_consumption <- read.csv("household_power_consumption.txt", header = T, sep = ';',na.strings = "?", nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')

## Convert the Date variable to Date Class
power_consumption$Date <- as.Date(power_consumption$Date, format = "%d/%m/%Y")

## Subsetting the data within the date ranges
data <- subset(power_consumption, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Histogram plot
hist(data$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")

## Copy my plot to a PNG file
dev.copy(png, file = "plot1.png") 

## Closing PNG device
dev.off()