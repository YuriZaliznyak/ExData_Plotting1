data <- read.table("household_power_consumption.txt", sep = ";", 
                   na.strings = "?", skip = 66637, nrows = 2880)

colnames(data) = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                                     "Voltage", "Global_intensity", "Sub_metering_1", 
                                     "Sub_metering_2", "Sub_metering_3")

datetime_row <- strptime(paste(as.character(data$Time), as.character(data$Date)), 
                         format = "%H:%M:%S %d/%m/%Y")
data2plot <- cbind(datetime_row, data)
Sys.setlocale("LC_TIME", "English")

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

plot(data2plot$datetime_row, data2plot$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power")

plot(data2plot$datetime_row, data2plot$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(data2plot$datetime_row, data2plot$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")
points(data2plot$datetime_row, data2plot$Sub_metering_2, type = "l", col = "red")
points(data2plot$datetime_row, data2plot$Sub_metering_3, type = "l", col = "blue")
legend("topright", col=c("black", "red", "blue"), lty = 1, bty= "n", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data2plot$datetime_row, data2plot$Global_active_power, type = "l", xlab = "datetime", 
     ylab = "Global_Reactive_Power")
dev.off()
