my_data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
ele <- subset(my_data, Date == '1/2/2007' | Date == '2/2/2007')
ele[,"Date"] <- as.Date( ele[,"Date"] , format = "%d/%m/%Y")
ele$FullDatetime <- strptime(paste(ele$Date,ele$Time), format="%Y-%m-%d %H:%M:%S")


png(filename = "plot4.png", width = 480, height=480)
par(mfrow = c(2,2))
plot(ele$FullDatetime, as.numeric(as.character(ele$Global_active_power)), type="l", xlab="", ylab="Global active power")

plot(ele$FullDatetime, as.numeric(as.character(ele$Voltage)), type="l", xlab="datetime", ylab="Voltage")


plot(ele$FullDatetime, as.numeric(as.character(ele$Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering")
lines(ele$FullDatetime, as.numeric(as.character(ele$Sub_metering_2)), type="l", col = "red")
lines(ele$FullDatetime, as.numeric(as.character(ele$Sub_metering_3)), type="l", col = "blue")
legend( "topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue") , lty = 1, bty = "n")

plot(ele$FullDatetime, as.numeric(as.character(ele$Global_reactive_power)), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

