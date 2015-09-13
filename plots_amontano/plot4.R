## Get data and subset
##
data1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
data1$DateTime <- paste(data1$Date, data1$Time)
data1$DateTime <- strptime(data1$DateTime,"%d/%m/%Y %H:%M:%S")
date1 <- "2007-02-01 00:00:00"
date1 <- strptime(date1, "%Y-%m-%d %H:%M:%S")
date2 <- "2007-02-03 00:00:00"
date2 <- strptime(date2, "%Y-%m-%d %H:%M:%S")
data3 <- subset(data1, DateTime >= date1 & DateTime < date2)
##
## Graph Construction
##
png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
plot(data3$DateTime, data3$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", cex.lab = 0.7, cex.axis = 0.7)
plot(data3$DateTime, data3$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", cex.lab = 0.7, cex.axis = 0.7)
plot(data3$DateTime, data3$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub metering", cex.lab = 0.7, cex.axis = 0.7)
points(data3$DateTime, data3$Sub_metering_2, type = "l", col = "red")
points(data3$DateTime, data3$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty=1, col = c("black","red", "blue"), legend = c("Submetering_1","Submetering_2", "Submetering_3"), cex = 0.7, bty = "n")
plot(data3$DateTime, data3$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", cex.lab = 0.7, cex.axis = 0.7)
dev.off()