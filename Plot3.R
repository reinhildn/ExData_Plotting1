data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("NA","?"))
power <- data
power$Date <- as.Date(strptime(power$Date, format = "%d/%m/%Y"))
power$Time <- format(power$Time, format = "%H:%M:%S")
head(power)

use1 <- subset(power, power$Date == "2007-02-01")
use2 <- subset(power, power$Date == "2007-02-02")
use <- rbind(use1,use2)
head(use)

##plot3
use$DateTime <- as.POSIXct(paste(use$Date, use$Time), format="%Y-%m-%d %H:%M:%S")
with(use, plot(DateTime, Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = ""))
with(use, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(use, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = 2)

dev.copy(png,"plot3.png")
dev.off()