# Course Project 1 for Exploratory Data Class
# create graphs for Electric Power Consumption Dataset
# Plot 4

library(dplyr)

# Read in data set
txtfile <-"exdata-data-household_power_consumption/household_power_consumption.txt"
tempfile <- read.table(txtfile, header = TRUE, sep = ";", na.strings = "?")

# re-format dates
tempfile$Date <- strptime(tempfile$Date, "%d/%m/%Y")
tempfile$Date <- as.Date(tempfile$Date, "%Y-%m-%d")

# subset the dates for the project
powerset <- filter(tempfile, (Date == "2007-02-01" | Date == "2007-02-02"))
class(powerset$Date)

# reformat time
powerset2 <- mutate(powerset, datetime = as.POSIXct(paste(Date, Time)))

# create plot 4 and output to a png file
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(powerset2, {
# plot 1
    plot(datetime, Global_active_power, type = "l", col = "black", xlab = "", ylab = "Global Active Power (kilowatts)")
# plot 2
    plot(datetime, Voltage, type = "l")
# plot 3  
    plot(datetime, Sub_metering_1, col = "black", type = "l", pch = 46, xlab = "", ylab = "Energy sub metering")
    lines(datetime, Sub_metering_2, col = "red", type = "l", pch = 46, xlab = "", ylab = "Energy sub metering")
    lines(datetime, Sub_metering_3, col = "blue", type = "l", pch = 46, xlab = "", ylab = "Energy sub metering")
    legend("topright", lty = 1, col = c("black", "red", "blue"), bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# plot 4
    plot(datetime, Global_reactive_power, type = "l")
})
dev.off()
