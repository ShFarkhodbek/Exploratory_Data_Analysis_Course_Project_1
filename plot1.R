setwd("~/Documents/Data_science/Exploratory Data Analysis/week1/Assignment")

epower <- read.table("household_power_consumption.txt", sep = ";",
                header = TRUE, stringsAsFactors = FALSE, dec = ".")
epower1 <- subset(epower, epower$Date == "1/2/2007" | epower$Date == "2/2/2007")

class(epower1$Global_active_power)

epower1$Global_active_power <- as.numeric(as.character(epower1$Global_active_power))
lapply(epower1$Global_active_power, class)

png("plot1.png", width=480, height=480)
hist(epower1$Global_active_power, xlab = "Global active power", col = "red",
                                main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
