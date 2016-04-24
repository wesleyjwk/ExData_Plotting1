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

# Create and save third plot
png("plot3.png", width = 480, height = 480)
par(mar = c(3,5,2,2) + 0.1)
with(hpcsub, {
        plot(DateTime, Sub_metering_1, type = "l", 
             ylab = "Energy Sub Metering", xlab = "")
        lines(DateTime, Sub_metering_2, type = "l", col = "red")
        lines(DateTime, Sub_metering_3, type = "l", col = "blue")
        legend("topright", c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), 
              lty = 1, lwd = 1, col = c("black", "red", "blue"))
})
dev.off()
