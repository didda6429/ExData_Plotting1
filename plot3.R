##reads the data and converts the date variable from a factor to a Date before taking
##the date and time variables and converting them to a combined POSIXct
data <- read.table("household_power_consumption.txt",header=TRUE,na.strings = "?",sep=";")
data[,1] <- as.Date(data[,1],format="%d/%m/%Y")
data <- subset(data,Date=="2007-02-01"|Date=="2007-02-02")
datetime <- as.POSIXct(paste(as.character(data$Date),as.character(data$Time)),format="%F %H:%M:%S")
##creates a png device and writes the plot by initialising the plot with a single
##variable (Sub_metering_1) and then adding the remaining variables (Sub_metering_2 and
##Sub_metering_3) to the plot
png("plot3.png")
plot(datetime,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(datetime,data$Sub_metering_2,col="red",type="l")
lines(datetime,data$Sub_metering_3,col="blue",type="l")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","blue","red"))
dev.off()