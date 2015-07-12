
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
plot(subdata$date_and_time, subdata$Global_active_power_num, type = "l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,file="plot2.png")
dev.off()
