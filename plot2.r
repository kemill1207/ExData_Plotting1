# Creates a plot measuring the Global Active Power over the sample two-day period

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   colClasses = c("character", "character", "double", "double",
                                  "double", "double", "double", "double", "double"),
                   na.strings = "?")

data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data[2] <- paste(data$Date, data$Time)
data[2] <- sapply(data[2], strptime, format="%d/%m/%Y %H:%M:%S")
colnames(data)[2] <- "Date_Time"
data <- data[2:9]

png("plot2.png", width = 480, height = 480)

plot(data$Date_Time, data$Global_active_power, type = "l", main = "", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.off()