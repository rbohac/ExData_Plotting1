
if (!file.exists("household_power_consumption.txt"))
  {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile ="household_power_consumption.zip")
    unzip("household_power_consumption.zip")
}
mydata = read.csv(file="household_power_consumption.txt",head=TRUE,sep=";")
subdata<- mydata[as.Date(as.character(mydata$Date), "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(as.character(mydata$Date), "%d/%m/%Y") <= as.Date("2007-02-02"),]
data <- as.numeric(subdata$Global_active_power)
data <- data/1000
hist(data,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()
