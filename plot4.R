#Drawing four plots using mfrow.
png("plot4.png")
data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),sep=";",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),na.strings = "?")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

#Having the right class(Date) using as.Date() and strpTime() functions
data$Date <- as.Date(data$Date, format='%d/%m/%Y')
data$DateTime <- paste(data$Date,data$Time)
data$DateTime <- strptime(data$DateTime,format="%Y-%m-%d %H:%M:%S")
#1
plot(data$DateTime,data$Global_active_power, ylab="Global Active Power",xlab="",type="l",lty=1,lwd=1)
#2
plot(data$DateTime,data$Voltage,lty=1,type = "l",lwd=1,ylab = "Voltage",xlab="datetime")
#3
plot(data$DateTime, data$Sub_metering_1, col="black", type="l",lty=1,lwd=1,ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red",type="l",lty=1,lwd=1)
lines(data$DateTime, data$Sub_metering_3, col="blue",type="l",lty=1,lwd=1)
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1)
#4
plot(data$DateTime,data$Global_reactive_power,lty=1,type = "l",lwd=1,ylab = "Global_reactive_power",xlab="datetime")
par(mfrow = c(1, 1))
dev.off()
