# reading data
data <- read.table("household_power_consumption.txt",sep = ";", 
                   header = TRUE, stringsAsFactors = FALSE)

# convert date variables
data$Time2 <- paste(data$Date, data$Time)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time2 <- strptime(data$Time2, "%d/%m/%Y %H:%M:%S")

# subsetting the data
data2 <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# convert numerical variables
for(i in 3:9){
    data2[,i] <- as.numeric(data2[,i])
}


# plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# 1st plot
plot(data2$Time2, data2$Global_active_power, type = "l",
     ylab = "Global Active Power", xlab = "")

# 2nd plot
plot(data2$Time2, data2$Voltage, type = "l",
     ylab = "Voltage", xlab = "datetime")


# 3rd plot
plot(data2$Time2, data2$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = "")
lines(data2$Time2, data2$Sub_metering_2, col = "red")
lines(data2$Time2, data2$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "blue", "red"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# 4th plot
plot(data2$Time2, data2$Global_reactive_power, type = "l",
     ylab = "Global Reactive Power", xlab = "datetime")


dev.off()