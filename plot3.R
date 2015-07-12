## Read full data
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")

## Subset using only dates 1/2/2007 and 2/2/2007
hpc_subset <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007" ,]

## Date+Time
date_time <- strptime(paste(hpc_subset$Date, hpc_subset$Time), "%d/%m/%Y %H:%M:%S")

## Conveqt to numeric
sub_metering_1 <- as.numeric(hpc_subset$Sub_metering_1)
sub_metering_2 <- as.numeric(hpc_subset$Sub_metering_2)
sub_metering_3 <- as.numeric(hpc_subset$Sub_metering_3) 


## Looks like there is some kind of bug when copying from screen to png - legend text is being truncated
## As a workaround creating plots using file device
png("plot3.png", width=480, height=480) 
plot (date_time, sub_metering_1, type="l", xlab="", ylab="Energy Submetering")
lines(date_time, sub_metering_2, type="l", col="red")
lines(date_time, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2)
dev.off()


