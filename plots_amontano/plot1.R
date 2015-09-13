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
## Construct Graph
##
png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(data3$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()