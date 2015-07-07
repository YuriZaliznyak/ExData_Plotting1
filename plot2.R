data <- read.table("household_power_consumption.txt", sep = ";", 
                   na.strings = "?", skip = 66637, nrows = 2880)

colnames(data) = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                                     "Voltage", "Global_intensity", "Sub_metering_1", 
                                     "Sub_metering_2", "Sub_metering_3")

datetime_row <- strptime(paste(as.character(data$Time), as.character(data$Date)), 
                         format = "%H:%M:%S %d/%m/%Y")
data2plot <- cbind(datetime_row, data)
Sys.setlocale("LC_TIME", "English")
png(filename = "plot2.png", width = 480, height = 480)
plot(data2plot$datetime_row, data2plot$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()
