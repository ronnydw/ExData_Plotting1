# Execute this script in the folder with the extracted data: household_power_consumption.txt

library(lubridate)

# read the data
household_power_consumption <- 
  read.csv("~/Desktop/DataScience/household_power_consumption.txt", sep=";", na.strings="?")

# covert to date format
household_power_consumption$Date <- dmy(household_power_consumption$Date)

# Select the range from Feb 1st to 2nd 2007
consumptionRange <- subset(household_power_consumption, Date >= "2007-02-01" & Date < "2007-02-03")
consumptionRange$Date_time <- ymd_hms(paste(consumptionRange$Date, consumptionRange$Time))

png(file = "plot3.png")

# plot the sub_metering graph
with(consumptionRange, plot(Sub_metering_1 ~ Date_time, type = "n", ylab = "Energy sub metering", xlab = ""))
with(consumptionRange, lines(Sub_metering_1 ~ Date_time, lty="solid"))
with(consumptionRange, lines(Sub_metering_2 ~ Date_time, lty="solid", col = "red"))
with(consumptionRange, lines(Sub_metering_3 ~ Date_time, lty="solid", col = "blue"))
legend(x = "topright", lty = c("solid", "solid", "solid"), col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.off()
