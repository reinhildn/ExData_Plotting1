data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("NA","?"))
power <- data
power$Date <- as.Date(strptime(power$Date, format = "%d/%m/%Y"))
power$Time <- format(power$Time, format = "%H:%M:%S")
head(power)

use1 <- subset(power, power$Date == "2007-02-01")
use2 <- subset(power, power$Date == "2007-02-02")
use <- rbind(use1,use2)
head(use)

##plot2
use$DateTime <- as.POSIXct(paste(use$Date, use$Time), format="%Y-%m-%d %H:%M:%S")
with(use, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatt)", xlab = ""))
dev.copy(png,"plot2.png")
dev.off()
