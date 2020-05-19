file <- file("household_power_consumption.txt")  ## creating the connection object

## Reading the file row which contains dade: 1/2/2007 and 2/2/2007 

data = read.table(text = grep("^[1,2]/2/2007", readLines(file), value = TRUE), header = TRUE, sep = ";",
                   col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power",
                                 "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Plot 1: Global Active Power

hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", col = "red", main = "Global Active Power")

## copying the plot to png file

dev.copy(png, file = "plot1.png",  width = 480, height = 480, units = "px") 
dev.off()   ## don't forget to close the PNG device
