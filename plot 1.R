##Carlos Gee

##Read data and format
power_data <- read.table("household_power_consumption.txt",blank.lines.skip=TRUE,strip.white=TRUE,header=TRUE,sep=";",na.strings="?")
power_data$Date<-as.Date(power_data$Date, "%d/%m/%Y")
power_data$Time<-paste(power_data$Date,power_data$Time)
power_data$Time<-strptime(power_data$Time,format="%Y-%m-%d %H:%M:%S")

##sub set correct dates
sub_power_data<-power_data[power_data$Date %in% as.Date(c("1/2/2007", "2/2/2007"), "%d/%m/%Y"), c(1,2,3)]

##Plot
##hist(sub_power_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red", xlim=c(0,6), ylim = c(0,1200))

##save plot
dev.new()
hist(sub_power_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red", xlim=c(0,6), ylim = c(0,1200))
dev.copy(png,file="plot 1.png",width = 480, height = 480,bg="white")
dev.off()