##plot2.R

##Read the whole dataset

data<- read.table("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

##Subset the data for the 2 days in February

subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Convert date and time 

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Subset for Global Active Power (GAP)

GAP <- as.numeric(subSetData$Global_active_power)

##Plot as a png

png("plot2.png", height = 480, width=480)
plot(datetime, GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

