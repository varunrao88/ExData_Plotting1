my_data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
ele <- subset(my_data, Date == '1/2/2007' | Date == '2/2/2007')
ele[,"Date"] <- as.Date( ele[,"Date"] , format = "%d/%m/%Y")
ele$FullDatetime <- strptime(paste(ele$Date,ele$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height=480)
plot(ele$FullDatetime, as.numeric(as.character(ele$Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

