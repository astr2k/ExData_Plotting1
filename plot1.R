## Read full data
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")

## Subset using only dates 1/2/2007 and 2/2/2007
hpc_subset <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007" ,]

## Create histogram on screen
hist(hpc_subset$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col="Red")

## Copy to PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
