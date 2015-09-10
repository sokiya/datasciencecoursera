

## Set the working directory
setwd("E:/Coursera/4_Exploratory Data Analysis/exdata-data-household_power_consumption")

## Read the data
power_consumption <- read.csv("household_power_consumption.txt", header = T, sep = ';',na.strings = "?", nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')

## Converting dates
datetime <- paste(as.Date(power_consumption$Date), power_consumption$Time)
power_consumption$Datetime <- as.POSIXct(datetime)