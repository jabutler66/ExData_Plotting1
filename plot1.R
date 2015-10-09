# Course Project 1 for Exploratory Data Class
# create graphs for Electric Power Consumption Dataset
# Plot 1

library(dplyr)

# Read in data set
# txtfile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
txtfile <-"exdata-data-household_power_consumption/household_power_consumption.txt"
tempfile <- read.table(txtfile, header = TRUE, sep = ";", na.strings = "?")

# re-format dates
tempfile$Date <- strptime(tempfile$Date, "%d/%m/%Y")
tempfile$Date <- as.Date(tempfile$Date, "%Y-%m-%d")

# subset the dates for the project
powerset <- filter(tempfile, (Date == "2007-02-01" | Date == "2007-02-02"))

# create plot 1 and output to a png file
png(file = "plot1.png", width = 480, height = 480)
with(powerset, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
    main = "Global Active Power"))
dev.off()
