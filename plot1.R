
#load data, seperation by ; and n/a's as ?

file_path <- "~/Coursera/Data Science Specialization/Exploratory Data Analysis/Week 1/household_power_consumption.txt"
data <- read.table(file_path, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

#fix dates
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#subset for 2 days: 2007-02-01 and 2007-02-02
#example: newdata <- subset(mydata, age >= 20 | age < 10, select=c(ID, Weight))
data_sub <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#fix numeric
#data_sub$Global_active_power <- as.numeric(data_sub$Global_active_power)

#histogram
hist(data_sub$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

#make file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()