# Execute this script in the folder with the extracted data: household_power_consumption.txt

library(lubridate)

# read the data
household_power_consumption <- 
  read.csv("~/Desktop/DataScience/household_power_consumption.txt", sep=";", na.strings="?")

# convert to date format
household_power_consumption$Date <- dmy(household_power_consumption$Date)

# Select the range from Feb 1st to 2nd 2007
consumptionRange <- subset(household_power_consumption, Date >= "2007-02-01" & Date < "2007-02-03")
consumptionRange$Date_time <- ymd_hms(paste(consumptionRange$Date, consumptionRange$Time))
 
png(file = "plot2.png")

# plot Global Active Power
with(consumptionRange, plot(Global_active_power ~ Date_time, type = "n", ylab = "Global Active Power (kilowatts)", xlab = ""))
with(consumptionRange, lines(Global_active_power ~ Date_time, lty="solid"))
dev.off()
