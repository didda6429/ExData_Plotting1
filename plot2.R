##reads the data and converts the date variable from a factor to a Date before taking
##the date and time variables and converting them to a combined POSIXct
data <- read.table("household_power_consumption.txt",header=TRUE,na.strings = "?",sep=";")
data[,1] <- as.Date(data[,1],format="%d/%m/%Y")
data <- subset(data,Date=="2007-02-01"|Date=="2007-02-02")
datetime <- as.POSIXct(paste(as.character(data$Date),as.character(data$Time)),format="%F %H:%M:%S")
##opens a png device and writes the plot before closing the png
png("plot2.png")
plot(datetime,data$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()