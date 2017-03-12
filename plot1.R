##plot1.R

##Read the whole dataset

data<- read.table("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

##Subset the data for the 2 days in February

subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Subset for Global Active Power (GAP)

GAP <- as.numeric(subSetData$Global_active_power)

##Plot hist as a png

png("plot1.png", height = 480, width=480)
hist(GAP, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
