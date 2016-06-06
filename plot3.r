## Plot 3
## Read the Data file
data <- read.csv("./household_power_consumption.txt", header=T, sep=';', stringsAsFactors=F)

## Subset Data
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Convert Data types
subsetData$Date <- as.Date(subsetData$Date, format="%d/%m/%Y")
subsetData$Sub_metering_1 <- as.numeric(subsetData$Sub_metering_1)
subsetData$Sub_metering_2 <- as.numeric(subsetData$Sub_metering_2)
subsetData$Sub_metering_3 <- as.numeric(subsetData$Sub_metering_3)

## Concatenate date and time
dateTime <- paste(as.Date(subsetData$Date), subsetData$Time)
subsetData$Date_Time <- as.POSIXct(dateTime)

##Plotting

plot(subsetData$Date_Time, subsetData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(subsetData$Date_Time, subsetData$Sub_metering_2, type="l", col="red")
lines(subsetData$Date_Time, subsetData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"), cex = .75)


## Saving to file
dev.copy(png, file="plot3.png", height=600, width=600)
dev.off()
