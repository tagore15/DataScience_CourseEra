pc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
pc$DataR <- as.Date(pc$Date, "%d/%m/%Y")
DATE1 <- "2007-02-01"
DATE2 <- "2007-02-02"
pc1 <- subset(pc, DataR >= DATE1 & DataR <= DATE2)
pc1$Day <- weekdays(pc1$DataR)
pc1$TotalTime <- as.POSIXct(paste(pc1$DataR, pc1$Time), format="%Y-%m-%d %H:%M:%S")
png("plot3.png", width = 480, height = 480)
plot(pc1$TotalTime, pc1$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(pc1$TotalTime, pc1$Sub_metering_2, col = "red")
lines(pc1$TotalTime, pc1$Sub_metering_3, col = "blue")
legend('topright', c("sub_metering_1","sub_metering_2", "sub_metering_3"), col = c('black', 'red','blue'), lty =1)
dev.off()
