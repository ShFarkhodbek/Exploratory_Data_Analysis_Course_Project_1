setwd("~/Documents/Data_science/Exploratory Data Analysis/week1/Assignment")

epower <- read.table("household_power_consumption.txt", sep = ";",
                     header = TRUE, stringsAsFactors = FALSE, dec = ".")

epower2 <- subset(epower, epower$Date == "1/2/2007" | epower$Date == "2/2/2007")
class(epower2$Date)
class(epower2$Time)

Date_Time <- strptime(paste(epower2$Date, epower2$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
Global_active_power <- as.numeric(epower2$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(Date_Time, Global_active_power, type = "l", xlab = "", 
                   ylab = "Global Active Power (kilowatts)")
dev.off()
     
