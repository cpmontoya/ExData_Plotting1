## this script creates a histogram Global Active Power from the file 
## "household_power_consumption.txt". The file comes from data at 
## UC Irvine Machine Learning Repository   http://archive.ics.uci.edu/ml/
## The histogram is created as a 480 by 480 png file "plot1.png" 

## read data from local file into data.frame
power<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)

## limit data to two days Feb 1 and Feb 2 of 2007
power<-power[power$Date=="1/2/2007"|power$Date=="2/2/2007",]

png(file="plot1.png",width=480,height=480)

hist(power$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)",ylim=c(0,1200))

##close png file
dev.off()