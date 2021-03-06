#plot1
png("plot1.png")
data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),sep=";",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),na.strings = "?")
par(mfrow = c(1, 1))
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()



