##Carlos Gee

##Read data and format
power_data <- read.table("household_power_consumption.txt",blank.lines.skip=TRUE,strip.white=TRUE,header=TRUE,sep=";",na.strings="?")
power_data$Date<-as.Date(power_data$Date, "%d/%m/%Y")
power_data$Time<-paste(power_data$Date,power_data$Time)
power_data$Time<-strptime(power_data$Time,format="%Y-%m-%d %H:%M:%S")

##sub set correct dates
sub_power_data<-power_data[power_data$Date %in% as.Date(c("1/2/2007", "2/2/2007"), "%d/%m/%Y"),]

##Plot
##par(mfrow=c(2,2))
####TL
##with(sub_power_data,plot(Time,Global_active_power,type="l",ylab="Global Active Power",xlab=""))
####TR
##with(sub_power_data,plot(Time,Voltage,type="l",ylab="Voltage",xlab="datetime"))
####BL
##with(sub_power_data,plot(Time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
##lines(sub_power_data$Time,sub_power_data$Sub_metering_2,col="red")
##lines(sub_power_data$Time,sub_power_data$Sub_metering_3,col="blue")
##legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)
####BR
##with(sub_power_data,plot(Time,Global_reactive_power,type="l",ylab=" Global_reactive_power",xlab="datetime"))

##save plot
dev.new()
par(mfrow=c(2,2))
#TL
with(sub_power_data,plot(Time,Global_active_power,type="l",ylab="Global Active Power",xlab=""))
#TR
with(sub_power_data,plot(Time,Voltage,type="l",ylab="Voltage",xlab="datetime"))
#BL
with(sub_power_data,plot(Time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
lines(sub_power_data$Time,sub_power_data$Sub_metering_2,col="red")
lines(sub_power_data$Time,sub_power_data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)
#BR
with(sub_power_data,plot(Time,Global_reactive_power,type="l",ylab=" Global_reactive_power",xlab="datetime"))
dev.copy(png,file="plot 4.png",width = 480, height = 480,bg="white")
dev.off()
