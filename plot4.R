# Load text file into R
my_data <- read.table("household_power_consumption.txt" , sep = ";" , header = TRUE , colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric" , "numeric", "numeric"), na.strings = "?" )

# Subset out 1st & 2nd Feb 2007 data
my_data$Date <- as.Date(my_data$Date, "%d/%m/%Y")
my_data <-  subset(my_data, Date == "2007-02-01" | Date == "2007-02-02")

# Combine the Date & Time and convert it to Date/Time classes
DateTime <- paste(as.character(my_data$Date), my_data$Time)
DateTime <- strptime(DateTime, "%Y-%m-%d %H:%M:%S")

# Combine the new DateTime column into the table
my_data <- cbind(my_data, DateTime)


# Plot the graph
png(filename = "plot4.png", width = 480, height = 480)

par(mfcol = c(2,2))     # Set the layout to 2x2

plot(my_data$DateTime, my_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(my_data$DateTime, my_data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
points(my_data$DateTime, my_data$Sub_metering_2, type = "l", col = "red")
points(my_data$DateTime, my_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1, lwd = 1)

plot(my_data$DateTime, my_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(my_data$DateTime, my_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()