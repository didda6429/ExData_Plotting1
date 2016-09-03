##reads the data and converts the date variable from a factor to a Date 
##n.b. the Time variable isn't adjusted because it doesn't affect this plot
data <- read.table("household_power_consumption.txt",header=TRUE,na.strings = "?",sep=";")
data[,1] <- as.Date(data[,1],format="%d/%m/%Y")
data <- subset(data,Date=="2007-02-01"|Date=="2007-02-02")
##opens a png device and writes the plot before closing the png
png("plot1.png")
hist(data$Global_active_power,col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()