
hpc<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", stringsAsFactors = FALSE)

hpc2<-subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

DateTime<-paste(hpc2$Date, hpc2$Time)

DateTime<-strptime(DateTime, format="%d/%m/%Y %H:%M:%S")

hpc3<-cbind(hpc2, DateTime)

png("plot4.png")
par(mfrow = c(2, 2))
with(hpc3, {
        plot(hpc3$DateTime, hpc3$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        
        plot(hpc3$DateTime, hpc3$Voltage, type = "l", ylab="Voltage", xlab="datetime")
        
        with(hpc3, plot(hpc3$DateTime, hpc3$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
        with(hpc3, points(hpc3$DateTime, hpc3$Sub_metering_2, type="l", col="red"))
        with(hpc3, points(hpc3$DateTime, hpc3$Sub_metering_3, type="l", col="blue"))
        
        legend("topright", lty=1, col = c("black", "blue", "red"), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        
        plot(hpc3$DateTime, hpc3$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")
})

dev.off()