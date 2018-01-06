my_data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
ele <- subset(my_data, Date == '1/2/2007' | Date == '2/2/2007')
ele[,"Date"] <- as.Date( ele[,"Date"] , format = "%d/%m/%Y")
ele$FullDatetime <- strptime(paste(ele$Date,ele$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png", width = 480, height=480)
plot(ele$FullDatetime, as.numeric(as.character(ele$Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering")
lines(ele$FullDatetime, as.numeric(as.character(ele$Sub_metering_2)), type="l", col = "red")
lines(ele$FullDatetime, as.numeric(as.character(ele$Sub_metering_3)), type="l", col = "blue")
legend( "topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue") , lty = 1)


dev.off()

