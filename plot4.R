Data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
library("dplyr")
Data2<-filter(Data, Date=="1/2/2007")
Data3<-filter(Data, Date=="2/2/2007")
Data4<-rbind(Data2, Data3)

p2y<-as.numeric(Data4$Global_active_power)

#Sys.setlocale(locale = "USA")
date.time<-paste(Data4$Date, Data4$Time, sep=" ")
times<-strptime(date.time, "%d/%m/%Y %H:%M:%S")

library("ggplot2")
par(mfcol=c(2,2))
plot(times,p2y, type="l", ylab = "Global Active Power")

#Sys.setlocale(locale = "USA")
y1<-as.numeric(Data4$Sub_metering_1)
y2<-as.numeric(Data4$Sub_metering_2)
y3<-Data4$Sub_metering_3

plot(times, y1, type="l", col="black", ylab = "Energy Sub metering")
lines(times, y2, type="l", col="red")
lines(times, y3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=2, col=c("black", "red", "blue")))

vol<-Data4$Voltage
plot(times, vol, type="l")

Global_reactive_power<-Data4$Global_reactive_power
plot(times, Global_reactive_power, type="l")



dev.copy(png, "plot4.png", width=480, height=480)
dev.off()
