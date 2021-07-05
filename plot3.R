# Coursera - Johns Hopkins Data Science Specialization
# Course 4 - Exploratory Data Analysis - Project 1

# https://www.coursera.org/learn/exploratory-data-analysis/peer/ylVFo/course-project-1

# 2nd Plot

# Import data from txt file

file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")

# Subset data from the dates 2007-02-01 and 2007-02-02

data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

# Create the requested plot and save it to a png graphics device/file

# Executed the following two commands in the console and realized that the language is set to French

# Sys.getlocale()
# Sys.getlocale("LC_TIME")

# Set language to English (days in the x-axis)
Sys.setlocale("LC_TIME", "English")

png("plot2.png", width = 480, height = 480)

date_converted <- as.Date(data[, 1], format = "%d/%m/%Y")
time_converted <- strptime(data[, 2], format = "%H:%M:%S")
time_axis <- as.POSIXct(paste(date_converted, data[, 2]))

plot(time_axis, data[, 3], xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()