# Coursera - Johns Hopkins Data Science Specialization
# Course 4 - Exploratory Data Analysis - Project 1

# https://www.coursera.org/learn/exploratory-data-analysis/peer/ylVFo/course-project-1

# 4th Plot

# Import data from txt file

file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")

# Subset data from the dates 2007-02-01 and 2007-02-02

data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

# Create the requested plots and save them to a png graphics device/file

#png("plot4.png", width = 480, height = 480)

date_converted <- as.Date(data[, 1], format = "%d/%m/%Y")
time_converted <- strptime(data[, 2], format = "%H:%M:%S")
time_axis <- as.POSIXct(paste(date_converted, data[, 2]))

# Arrange the 2x2 plots layout
par(mfrow = c(2,2))

# plot commands in order (by row, from left to right)

# 1st plot
plot(time_axis, data[, 3], xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

# 2nd plot
plot(time_axis, data[, 5], xlab = "datetime", ylab = "Voltage", type = "l")

# 3rd plot
plot(time_axis, data[, 7], xlab = "", ylab = "Energy sub metering", type = "l")
lines(time_axis, data[, 8], col = "red")
lines(time_axis, data[, 9], col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), cex = 0.8, lty = 1 , bty = "n")

# 4th plot
plot(time_axis, data[, 4], xlab = "datetime", ylab = "Global_reactive_power", type = "l")

#dev.off()