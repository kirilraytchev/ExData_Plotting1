hpc<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", stringsAsFactors = FALSE)

hpc2<-subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

png("plot1.png")

hist(hpc2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()