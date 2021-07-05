# Coursera - Johns Hopkins Data Science Specialization
# Course 4 - Exploratory Data Analysis - Project 1

# https://www.coursera.org/learn/exploratory-data-analysis/peer/ylVFo/course-project-1

# 2nd Plot

# Import data from txt file

file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")

# Subset data from the dates 2007-02-01 and 2007-02-02

data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

# Save the histogram plot to a png graphics device/file

#png("plot1.png", width = 480, height = 480)

date_converted <- as.Date(data[, 1], format = "%d/%m/%y")
time_converted <- strptime(data[, 2], format = "%h:%m:%s")



plot(time_converted, data[, 3], ylab = "Global Active Power (kilowatts)", type = "l")
plot(data[, 3], type = "l")

#dev.off()