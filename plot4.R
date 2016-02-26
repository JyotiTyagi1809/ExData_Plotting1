# Setting the working directory where the unzipped data file is loaded
setwd("~/Courses/Coursera/Data Science/exdata_data_household_power_consumption")

#loading needed libraries
library(dplyr)
library(lubridate)

# Loading the table with full data
full_data<-read.table('household_power_consumption.txt', sep=';', header=TRUE)

# Checking the data load 
> dim(full_data)
# [1] 2075259       9

# Loading only subset of data for 2007-02-01 and 2007-02-02 dates
analysis_data<-full_data[full_data$Date=='1/2/2007' | full_data$Date=='2/2/2007',]

# Checking the data load 
> dim(analysis_data)
# [1] 2880    9

# Converting the date & time fields
analysis_data$DateTime<-dmy(analysis_data$Date)+hms(analysis_data$Time)



# R4
# Plotting the required chart with needed titles and sub titles
GlobalActivePower <- as.numeric(analysis_data$Global_active_power)
GlobalReactivePower <- as.numeric(analysis_data$Global_reactive_power)
voltage <- as.numeric(analysis_data$Voltage)
subMetering1 <- as.numeric(analysis_data$Sub_metering_1)
subMetering2 <- as.numeric(analysis_data$Sub_metering_2)
subMetering3 <- as.numeric(analysis_data$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()c(analysis_data$Global_reactive_power)
voltage <- as.numeric(analysis_data$Voltage)
subMetering1 <- as.numeric(analysis_data$Sub_metering_1)
subMetering2 <- as.numeric(analysis_data$Sub_metering_2)
subMetering3 <- as.numeric(analysis_data$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

