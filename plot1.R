# Set Working Directory
setwd("D:/Coursera/Exploratory Data Analysis/Week 1")

# Load Dataset
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                  na.strings = "?", stringsAsFactors = FALSE)

# Subsetting Dataset for timeframe 01/02/2007 - 02/02/2007
hpcsub <- hpc[hpc$Date %in% c("1/2/2007", "2/2/2007"), ]

# Convert Date and Time to appropriate format
datetime <- strptime(paste(hpcsub$Date, hpcsub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
hpcsub$DateTime <- datetime

# Create first plot
par(mar = c(5,5,4,2) + 0.1)
hist(hpcsub$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

# Save first plot
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
