##
##   Data Science Course 4: Exploratory Data Analysis
##   Course Project 1
##   4/11/2017
##
##   Plot 4: 4 plots in one page
##
##  
 
##   Prepare to read the file
##   install.packages("sqldf")  - may not be needed

library(sqldf)
library(lattice)

##   Pull select columns and rows
p4 <- read.csv.sql("household_power_consumption.txt", "select Date,Time,Global_active_power,Global_reactive_power,Voltage,Sub_metering_1,Sub_metering_2,Sub_metering_3 from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")

##   Convert dates from character to weekday/date datatypes
x <- paste(p4$Date, p4$Time)
p4d <- strptime(x, "%d/%m/%Y %H:%M:%S")
p4day <- weekdays(as.Date(p4d))
p4dg <- cbind(p4day,p4d,p4)

##   Setup png size
png(file="plot4.png",width=480,height=480)

##  multiple plots in one page
par(mfcol=c(2,2))

##  Plot Global active power
plot(Global_active_power ~ p4d, data = p4dg, type="l", xlab="", ylab="Global Active Power")

##  Plot Energy sub metering
plot(Sub_metering_1 ~ p4d, data = p4dg, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(Sub_metering_2 ~ p4d, data = p4dg,col="red")
lines(Sub_metering_3 ~ p4d, data = p4dg,col="blue")

legend("topright",lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

##  Plot voltage  ??? check on y axis tick marks
plot(Voltage ~ p4d, data = p4dg, type="l", xlab="datetime", ylab="Voltage")

##  Plot Global reactive power
plot(Global_reactive_power ~ p4d, data = p4dg, type="l", xlab="datetime", ylab="Global_reactive_power")

##   close device
dev.off()

