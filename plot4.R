setwd("~/Documents/Data_science/Exploratory Data Analysis/week1/Assignment")

epower <- read.table("household_power_consumption.txt", sep = ";",
                     header = TRUE, stringsAsFactors = FALSE, dec = ".")
epower4 <- subset(epower, epower$Date == "1/2/2007" | epower$Date == "2/2/2007")

Global_active_power <- as.numeric(as.character(epower4$Global_active_power))
Sub_metering_1 <- as.numeric(epower4$Sub_metering_1)
Sub_metering_2 <- as.numeric(epower4$Sub_metering_2)
Sub_metering_3 <- as.numeric(epower4$Sub_metering_3)
Voltage <- as.numeric(epower4$Voltage)
Global_reactive_power <- as.numeric(epower4$Global_reactive_power)
Date_Time <- strptime(paste(epower4$Date, epower4$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

#Plot1
plot(Date_Time, Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

#Plot2
plot(Date_Time, Sub_metering_1, type = "l", xlab = " ",
                   ylab = "Energy sub metering")
lines(Date_Time, Sub_metering_2, col = "red")
lines(Date_Time, Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1,1,1), bty = "n",
       ncol = 1)

#Plot3
plot(Date_Time, Voltage, type = "l", xlab = "datetime")

#Plot4
plot(Date_Time, Global_reactive_power, type = "l", xlab = "datetime")
dev.off()

