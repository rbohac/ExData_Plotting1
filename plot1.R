mydata = read.csv(file="household_power_consumption.txt",head=TRUE,sep=";")
subdata<- mydata[as.Date(as.character(mydata$Date), "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(as.character(mydata$Date), "%d/%m/%Y") <= as.Date("2007-02-02"),]
counts <- table(subdata$Global_active_power)
data <- as.numeric(subdata$Global_active_power)
data <- data/1000
hist(data,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()
