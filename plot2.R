# Course Project 1 for Exploratory Data Class
# create graphs for Electric Power Consumption Dataset
# Plot 2

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

# create plot 2 and output to a png file
png(file = "plot2.png", width = 480, height = 480)
with(powerset2, plot(datetime, Global_active_power, type = "l", col = "black", xlab = "", ylab = "Global Active Power (kilowatts)"))
with(powerset2, lines(datetime, Global_active_power))
dev.off()
