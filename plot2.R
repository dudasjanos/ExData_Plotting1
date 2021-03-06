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
png("plot2.png", width = 480, height = 480)

plot(data2$Time2, data2$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()