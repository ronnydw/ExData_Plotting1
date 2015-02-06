# Execute this script in the folder with the extracted data: household_power_consumption.txt

library(lubridate)

# read the data
household_power_consumption <- 
  read.csv("~/Desktop/DataScience/household_power_consumption.txt", sep=";", na.strings="?")

# convert to date format
household_power_consumption$Date <- dmy(household_power_consumption$Date)

# Select the range from Feb 1st to 2nd 2007
consumptionRange <- subset(household_power_consumption, Date >= "2007-02-01" & Date < "2007-02-03")

# create a hist on a png device 
png(file = "plot1.png")

# plot the histogram for Global Active Power
hist(consumptionRange$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
