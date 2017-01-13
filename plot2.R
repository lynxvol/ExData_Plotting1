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
png(filename = "plot2.png", width = 480, height = 480)

plot(my_data$DateTime, my_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()