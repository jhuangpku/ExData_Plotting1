# project 1 for course datascience
# this is code for the first plot

# 1. load data
data <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";", 
                  col.names = colnames(read.table(
                    "household_power_consumption.txt",
                    nrow = 1, header = TRUE, sep=";")))

# 2. transform date and time

data$datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#data$Date <- as.Date(data$Date, "%d/%m/%Y")
#data$Time <- strptime(data$Time, "%H:%M:%S")

# 3. make plots
Sys.setlocale(category = "LC_ALL", locale="C")
png(file = "figure/hw1_plot4.png")
par(mfrow = c(2,2))
# first plot
with(data, plot(datetime, Global_active_power, type = "l", xlab="", ylab = "Global Active Power"))
# second plot
with(data, plot(datetime, Voltage, type = "l", xlab="datetime", ylab = "Voltage"))
# third plot
with(data, plot(datetime, Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering"))
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))     
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       lty = 1)
# fourth plot
with(data, plot(datetime, Global_reactive_power, type = "l"))

dev.off()