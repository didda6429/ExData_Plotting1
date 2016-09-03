##reads the data and converts the date variable from a factor to a Date before taking
##the date and time variables and converting them to a combined POSIXct
data <- read.table("household_power_consumption.txt",header=TRUE,na.strings = "?",sep=";")
data[,1] <- as.Date(data[,1],format="%d/%m/%Y")
data <- subset(data,Date=="2007-02-01"|Date=="2007-02-02")
datetime <- as.POSIXct(paste(as.character(data$Date),as.character(data$Time)),format="%F %H:%M:%S")
##creates the png device and sets it up to plot 4 plots in a 2x2 arrangment
png("plot4.png")
par(mfrow=c(2,2))
##plots the first graph (using code from plot2.R)
plot(datetime,data$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
##plots the second graph
plot(datetime,data$Voltage,type="l",ylab="Voltage")
##plots the third graph (using code from plot3.R)
plot(datetime,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(datetime,data$Sub_metering_2,col="red",type="l")
lines(datetime,data$Sub_metering_3,col="blue",type="l")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","blue","red"))
##plots the fourth graph
plot(datetime,data$Global_reactive_power,type="l",ylab="Global_reactive_power")
dev.off()