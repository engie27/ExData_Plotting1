## Plot 2
## Read the Data file
data <- read.csv("./household_power_consumption.txt", header=T, sep=';', stringsAsFactors=F)

## Subset Data
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Convert Data types
subsetData$Date <- as.Date(subsetData$Date, format="%d/%m/%Y")
subsetData$Global_active_power <- as.numeric(subsetData$Global_active_power)

## Concatenate date and time
dateTime <- paste(as.Date(subsetData$Date), subsetData$Time)
subsetData$Date_Time <- as.POSIXct(dateTime)

## Plotting
plot(subsetData$Date_Time,subsetData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

