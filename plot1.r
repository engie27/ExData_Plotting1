## Plot 1
## Read the Data file
data <- read.csv("./household_power_consumption.txt", header=T, sep=';', stringsAsFactors=F) 

## Subset Data
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## make Numeric
subsetData$Global_active_power <- as.numeric(subsetData$Global_active_power)

#Plotting
hist(subsetData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()