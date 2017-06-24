data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("NA","?"))
power <- data
power$Date <- as.Date(strptime(power$Date, format = "%d/%m/%Y"))
power$Time <- format(power$Time, format = "%H:%M:%S")
head(power)

use1 <- subset(power, power$Date == "2007-02-01")
use2 <- subset(power, power$Date == "2007-02-02")
use <- rbind(use1,use2)
head(use)

##plot1
hist(use$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png")
dev.off()

