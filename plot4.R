file <- file("household_power_consumption.txt") ## creating the connection object

## Reading the file row which contains dade: 1/2/2007 and 2/2/2007

data = read.table(text = grep("^[1,2]/2/2007", readLines(file), value = TRUE), header = TRUE, sep = ";",
                  col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power",
                                "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## converting data and time to calender format

data$Date<- as.Date(data$Date, "%d/%m/%Y")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(data$DateTime)

par(mfrow = c(2,2))   ## divide plot area in 2 rows and 2 column

## Plot 4.1
with(data, plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
## Plot 4.2
with(data, plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

## Plot 4.3
with(data, plot(data$DateTime, data$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n"))
with(data, points(data$DateTime, data$Sub_metering_1, type = "l", col = "black"))
with(data, points(data$DateTime, data$Sub_metering_2, type = "l", col = "red"))
with(data, points(data$DateTime, data$Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_meternig_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, lwd = 2, cex = 0.7)

## Plot 4.4
with(data, plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))


## copying the plot to png file

dev.copy(png, file = "plot4.png",  width = 480, height = 480, units = "px")
dev.off()   ## don't forget to close the PNG device



