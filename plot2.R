## Need to change current locale in order to display in English weekdays.
## Windows platform

original_locale <- Sys.getlocale(category = "LC_TIME") 
Sys.setlocale("LC_TIME","English")

hpc <- read.table("household_power_consumption.txt", 
                  header = TRUE, 
                  sep = ";", 
                  dec = ".", 
                  na.strings = "?", 
                  stringsAsFactors = FALSE)

hpc2 <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

DateTime <- paste(hpc2$Date, hpc2$Time)

DateTime <- strptime(DateTime, format="%d/%m/%Y %H:%M:%S")

hpc3 <- cbind(hpc2, DateTime)

png("plot2.png")

with(hpc3, plot(hpc3$DateTime, 
                hpc3$Global_active_power, 
                type="l", 
                ylab="Global Active Power (kilowatts)", 
                xlab=""))

dev.off()

## Change back to original setting
Sys.setlocale(category = "LC_TIME", locale = original_locale)