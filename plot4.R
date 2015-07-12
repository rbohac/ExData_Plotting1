library(lubridate)
if (!file.exists("household_power_consumption.txt"))
{
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile ="household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}
mydata = read.csv(file="household_power_consumption.txt",head=TRUE,stringsAsFactors = FALSE,sep=";")
mydata$date_and_time <- with(mydata,strptime(paste(mydata$Date," ",mydata$Time), "%d/%m/%Y %H:%M:%S"))
mydata$dayofweek <- with(mydata,wday(date_and_time,label=T))

subdata<- mydata[dmy(mydata$Date) >= ymd("2007-02-01") & dmy(mydata$Date) <= ymd("2007-02-02"),]

subdata$Global_active_power_kw <- with(subdata,as.numeric(subdata$Global_active_power)/1000)
subdata$Global_active_power_num <- with(subdata,as.numeric(subdata$Global_active_power))



par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))

#Plot1

plot(subdata$date_and_time, subdata$Global_active_power_num, type = "l",ylab="Global Active Power (kilowatts)",xlab="")

#plot2
plot(subdata$date_and_time, subdata$Voltage, type = "l",ylab="Voltage",xlab="")

#plot3
plot(subdata$date_and_time, subdata$Sub_metering_1, type = "l",ylab="Energy sub metering",xlab="")
lines(subdata$date_and_time,subdata$Sub_metering_2,col="red")
lines(subdata$date_and_time,subdata$Sub_metering_3,col="blue")
legend("topright",bty = "n", inset=c(0.1,0),
       lwd=c(2.5,2.5),col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot4
plot(subdata$date_and_time, subdata$Global_reactive_power, type = "l",ylab="Global_reactive_power",xlab="")

dev.copy(png,file="plot4.png")
dev.off()