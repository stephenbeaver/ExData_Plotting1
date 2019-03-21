
#load data, seperation by ; and n/a's as ?

file_path <- "~/Coursera/Data Science Specialization/Exploratory Data Analysis/Week 1/household_power_consumption.txt"
data <- read.table(file_path, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

#fix dates
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#subset for 2 days: 2007-02-01 and 2007-02-02
#example: newdata <- subset(mydata, age >= 20 | age < 10, select=c(ID, Weight))
data_sub <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#fix times
data_sub$datetime <- strptime(paste(data_sub$Date, data_sub$Time), "%Y-%m-%d %H:%M:%S")

data_sub$datetime <- as.POSIXct(data_sub$datetime)


#note, this order matter, having the png afer the par set only gave one plot, the last one

#set png size
png("plot4.png", width=480, height=480)

#set par()
par(mfrow = c(2, 2))

#plot 1
plot(data_sub$datetime, data_sub$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#plot 2
plot(data_sub$datetime, data_sub$Voltage, type="l", xlab="datatime", ylab="Voltage")

#plot 3
plot(data_sub$Sub_metering_1 ~ data_sub$datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(data_sub$Sub_metering_2 ~ data_sub$datetime, col = "Red")
lines(data_sub$Sub_metering_3 ~ data_sub$datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot 4
plot(data_sub$datetime, data_sub$Global_reactive_power, type="l", xlab="datatime", ylab="Global Reactive Power")

dev.off()