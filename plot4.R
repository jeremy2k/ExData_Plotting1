mydata1<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",skip=66637,nrows=2880,
                    col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                    colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
)

mydate1<-strptime(paste(mydata1$Date,mydata1$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

plot(mydate1,mydata1$Global_active_power,type="n",xlab="",ylab="Global Active Power")

lines(mydate1,mydata1$Global_active_power)

plot(mydate1,mydata1$Voltage,type="n",xlab="datetime",ylab="Voltage")

lines(mydate1,mydata1$Voltage)

plot(mydate1,mydata1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")

lines(mydate1,mydata1$Sub_metering_1)

lines(mydate1,mydata1$Sub_metering_2,col="red")

lines(mydate1,mydata1$Sub_metering_3,col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

plot(mydate1,mydata1$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")

lines(mydate1,mydata1$Global_reactive_power)

dev.off()