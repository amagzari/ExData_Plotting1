# Coursera - Johns Hopkins Data Science Specialization
# Course 4 - Exploratory Data Analysis - Project 1

# https://www.coursera.org/learn/exploratory-data-analysis/peer/ylVFo/course-project-1

# 1st Plot

# Import data from txt file

file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")

# Subset data from the dates 2007-02-01 and 2007-02-02

data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

# Save the histogram plot to a png graphics device/file

png("plot1.png", width = 480, height = 480)

hist(data[, 3], col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()