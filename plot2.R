mydata1<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",skip=66637,nrows=2880,
                    col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                    colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
)

mydate1<-strptime(paste(mydata1$Date,mydata1$Time), "%d/%m/%Y %H:%M:%S")

plot(mydate1,mydata1$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")

lines(mydate1,mydata1$Global_active_power)

dev.copy(png,file="plot2.png")

dev.off()
