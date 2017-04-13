##
##   Data Science Course 4: Exploratory Data Analysis
##   Course Project 1
##   4/11/2017
##
##   Plot 3: Per Day: Energy Sub Metering
##
##  
 
##   Prepare to read the file
##   install.packages("sqldf")  - may not be needed

library(sqldf)
library(lattice)

##   Pull select columns and rows
p3 <- read.csv.sql("household_power_consumption.txt", "select Date,Time,Sub_metering_1,Sub_metering_2,Sub_metering_3 from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")

##   Setup png size
png(file="plot3.png",width=480,height=480)

##   Convert dates from character to weekday/date datatypes
x <- paste(p3$Date, p3$Time)
p3d <- strptime(x, "%d/%m/%Y %H:%M:%S")
p3day <- weekdays(as.Date(p3d))
p3dg <- cbind(p3day,p3d,p3)

##   Plot command
plot(Sub_metering_1 ~ p3d, data = p3dg, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(Sub_metering_2 ~ p3d, data = p3dg,col="red")
lines(Sub_metering_3 ~ p3d, data = p3dg,col="blue")

legend("topright",lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##   close device
dev.off()

