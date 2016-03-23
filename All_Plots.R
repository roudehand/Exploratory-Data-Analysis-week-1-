# Exploratory-Data-Analysis-week-1-
## reading the data from the text file
data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = F, colClasses = c("character","character", "numeric","numeric","numeric","numeric","numeric","numeric"))

data$timestamp = strptime(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S", tz="UTC") 
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC") 
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC") 
data = data[df.power$timestamp >= startDate & df.power$timestamp <= endDate, ] 

## making plot nr. 1
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts", col = "red")
dev.off()

## making plot nr. 2
png(filename = "plot2.png", width = 480, height = 480)
plot(data$timestamp, data$Global_active_power, xlab = "", type="l", ylab = "Global Active Power (kilowatt)")
dev.off()

## making plot nr. 3
png(filename = "plot3.png", width = 480, height = 480)
plot(data$timestamp, data$Sub_metering_1, type = "l", ylab = "Energy Submetering")
lines(data$timestamp, data$Sub_metering_2, type = "l", col = "red")
lines(data$timestamp, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))
dev.off()

## making first new part of plot nr. 4
plot(data$timestamp, data$Global_reactive_power, type = "l")
dev.off()
## making second part of plot nr 4, namely combining all the plots together. I saved the picture via the plots in Rstudio.
par(mfcol = c(2,2))
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts", col = "red")
plot(data$timestamp, data$Global_active_power, xlab = "", type="l", ylab = "Global Active Power (kilowatt)")
plot(data$timestamp, data$Sub_metering_1, type = "l", ylab = "Energy Submetering")
lines(data$timestamp, data$Sub_metering_2, type = "l", col = "red")
lines(data$timestamp, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))
plot(data$timestamp, data$Global_reactive_power, type = "l")
