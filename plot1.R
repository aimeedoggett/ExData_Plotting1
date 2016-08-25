#read in power consumption data set
powerData<-read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#subset just dates needed for plot
powerData$Date<-as.Date(powerData$Date, format = "%d/%m/%Y")
powerDataFeb0102 <- powerData[powerData$Date >= "2007-02-01" & powerData$Date <= "2007-02-02", ]

#set png device and size of png
png("plot1.png",  width = 480, height = 480, units = "px")
hist(powerDataFeb0102$Global_active_power
     , xlab = "Gloabl Active Power (kilowatts)"
     , main = "Global Active Power"
     , col="red")


#turn device off to save png
dev.off()
