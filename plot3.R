## this script plots the three Energy Sub metering variables over time from the file 
## "household_power_consumption.txt". The file comes from data at 
## UC Irvine Machine Learning Repository   http://archive.ics.uci.edu/ml/
## the link to download the file used below is 
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## The histogram is created as a 480 by 480 png file "plot3.png" 

## read data from local file into data.frame
power<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)

## limit data to two days Feb 1 and Feb 2 of 2007
power<-power[power$Date=="1/2/2007"|power$Date=="2/2/2007",]

png(file="plot3.png",width=480,height=480)

## convert Date and Time to 
x<-strptime(paste(power$Date,power$Time),"%d/%m/%Y %H:%M:%S")

plot(x,power$Sub_metering_1,type="l",xlab="",ylab="Energy Sub metering")
lines(x,power$Sub_metering_2,col="red")
lines(x,power$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##close png file
dev.off()