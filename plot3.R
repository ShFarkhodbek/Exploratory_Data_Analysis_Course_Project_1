setwd("~/Documents/Data_science/Exploratory Data Analysis/week1/Assignment")

epower <- read.table("household_power_consumption.txt", sep = ";",
                     header = TRUE, stringsAsFactors = FALSE, dec = ".")

epower3 <- subset(epower, epower$Date == "1/2/2007" | epower$Date == "2/2/2007")
class(epower2$Sub_metering_1)

epower3$Sub_metering_1 <- as.numeric(epower3$Sub_metering_1)
epower3$Sub_metering_2 <- as.numeric(epower3$Sub_metering_2)
epower3$Sub_metering_3 <- as.numeric(epower3$Sub_metering_3)
Date_Time <- strptime(paste(epower3$Date, epower3$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)
with(epower3, plot(Date_Time, Sub_metering_1,
                   type = "l", xlab = " ",
                   ylab = "Energy sub metering"))
with(epower3, lines(Date_Time, Sub_metering_2, col = "red"))
with(epower3, lines(Date_Time, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                        col = c("black", "red", "blue"), lty = c(1,1,1),
                        ncol = 1)
dev.off()

