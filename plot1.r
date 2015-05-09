# Creates a plot measuring the frequency of each value of Global ActivePower 
# and exports the plot to a png file

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   colClasses = c("character", "character", "double", "double",
                                  "double", "double", "double", "double", "double"),
                   na.strings = "?")

data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

png("plot1.png", width = 480, height = 480)

hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()