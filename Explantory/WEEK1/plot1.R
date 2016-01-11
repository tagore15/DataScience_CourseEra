pc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
pc$DataR <- as.Date(pc$Date, "%d/%m/%Y")
DATE1 <- "2007-02-01"
DATE2 <- "2007-02-02"
pc1 <- subset(pc, DataR >= DATE1 & DataR <= DATE2)
png("plot1.png", width = 480, height = 480)
hist(pc1$Global_active_power, col = 'red', xlab = "Global Active Power (kilowatt)", main = "Global Active Power")
dev.off()
