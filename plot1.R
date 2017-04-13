##
##   Data Science Course 4: Exploratory Data Analysis
##   Course Project 1
##   4/11/2017
##
##   Plot 1: Global Active Power
##
##  
 
##   Prepare to read the file
##   install.packages("sqldf")  - may not be needed

library(sqldf)

##   Pull select columns and rows
p1 <- read.csv.sql("household_power_consumption.txt", "select Date,Time,Global_active_power from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")

##   Setup png size
png(file="plot1.png",width=480,height=480)

##   Plot
hist(p1$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")

##   close device
dev.off()

