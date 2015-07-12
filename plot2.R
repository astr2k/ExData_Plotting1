## Read full data
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")

## Subset using only dates 1/2/2007 and 2/2/2007
hpc_subset <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007" ,]

## Date+Time
date_time <- strptime(paste(hpc_subset$Date, hpc_subset$Time), "%d/%m/%Y %H:%M:%S")

## Global Active Power as numeric
gap_numeric <- as.numeric(hpc_subset$Global_active_power)


## Create plot on screen
plot(date_time, gap_numeric, type="l", xlab="", ylab="Global Active Power (kilowatts)") 

## Copy to PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

