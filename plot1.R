my_data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
ele <- subset(my_data, Date == '1/2/2007' | Date == '2/2/2007')
png(filename = "plot1.png", width = 480, height=480)
hist(as.numeric(as.character(ele$Global_active_power)), main = "Global Active Power", col = "red", xlab = "Global Active Power(kilowatts)")
dev.off()

