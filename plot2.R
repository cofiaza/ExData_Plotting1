##
##   Data Science Course 4: Exploratory Data Analysis
##   Course Project 1
##   4/11/2017
##
##   Plot 2: Per Day: Global Active Power
##
##  
 
##   Prepare to read the file
##   install.packages("sqldf")  - may not be needed

library(sqldf)
library(lattice)

##   Pull select columns and rows
p2 <- read.csv.sql("household_power_consumption.txt", "select Date,Time,Global_active_power from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")

##   Setup png size
png(file="plot2.png",width=480,height=480)

##   Convert dates from character to weekday/date datatypes
x <- paste(p2$Date, p2$Time)
p2d <- strptime(x, "%d/%m/%Y %H:%M:%S")
p2day <- weekdays(as.Date(p2d))
p2dg <- cbind(p2day,p2d,p2)

##   Plot command
plot(Global_active_power ~ p2d, data = p2dg, type="l", xlab="", ylab="Global Active Power (kilowatts)")


##   close device
dev.off()

