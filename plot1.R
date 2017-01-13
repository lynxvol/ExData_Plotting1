# Load text file into R
my_data <- read.table("household_power_consumption.txt" , sep = ";" , header = TRUE , colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric" , "numeric", "numeric"), na.strings = "?" )

# Subset out 1st & 2nd Feb 2007 data
my_data$Date <- as.Date(my_data$Date, "%d/%m/%Y")
my_data <-  subset(my_data, Date == "2007-02-01" | Date == "2007-02-02")

# Plot the graph
png(filename = "plot1.png", width = 480, height = 480)

hist(my_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()