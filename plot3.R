##plot3.R

##Read the whole dataset

data<- read.table("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

##Subset the data for the 2 days in February

subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Convert date and time 

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Subset for Global Active Power (GAP)

GAP <- as.numeric(subSetData$Global_active_power)

##Create the 3 submetering datasets

subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

##Plot as a png

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")

lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5, col=c("black", "red", "blue"))
dev.off()