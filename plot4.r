# Creates a set of four plots analyzing the household power consumption over
# the two-day sample period

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   colClasses = c("character", "character", "double", "double",
                                  "double", "double", "double", "double", "double"),
                   na.strings = "?")

data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data[2] <- paste(data$Date, data$Time)
data[2] <- sapply(data[2], strptime, format="%d/%m/%Y %H:%M:%S")
colnames(data)[2] <- "Date_Time"
data <- data[2:9]

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
plot(data$Date_Time, data$Global_active_power, type = "l", main = "", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

plot(data$Date_Time, data$Voltage, type = "l", main = "", xlab = "datetime", 
     ylab = "Voltage")

plot(data$Date_Time, data$Sub_metering_1, type = "n", main = "", xlab = "", 
     ylab = "Energy sub metering")
lines(data$Date_Time, data$Sub_metering_1, type = "l", col = "black")
lines(data$Date_Time, data$Sub_metering_2, type = "l", col = "red")
lines(data$Date_Time, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$Date_Time, data$Global_reactive_power, type = "l", main = "", 
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()