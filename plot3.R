#read in power consumption data set
powerData<-read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#subset just dates needed for plot
powerData$Date<-as.Date(powerData$Date, format = "%d/%m/%Y")
powerDataFeb0102 <- powerData[powerData$Date >= "2007-02-01" & powerData$Date <= "2007-02-02", ]


#create new column with combined date and time
powerDataFeb0102$CombDateTime <- paste(powerDataFeb0102$Date,powerDataFeb0102$Time)

#set new column as date time format
powerDataFeb0102$CombDateTimeNew<-strptime(powerDataFeb0102$CombDateTime, format = "%Y-%m-%d %H:%M:%S")

#set png device and size of png
png("plot3.png",  width = 480, height = 480, units = "px")

#create line plot
plot(powerDataFeb0102$CombDateTimeNew, powerDataFeb0102$Sub_metering_1 , type = "l", xlab='',  ylab="Energy sub metering")
points(powerDataFeb0102$CombDateTimeNew, powerDataFeb0102$Sub_metering_2 , col='red', type = "l")
points(powerDataFeb0102$CombDateTimeNew, powerDataFeb0102$Sub_metering_3 , col='blue', type = "l")

#add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

#turn device off to save png
dev.off()