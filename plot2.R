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


# R2
# Plotting the required chart
GlobalActivePower <- as.numeric(analysis_data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

