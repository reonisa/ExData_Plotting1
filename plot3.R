Data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
library("dplyr")
Data2<-filter(Data, Date=="1/2/2007")
Data3<-filter(Data, Date=="2/2/2007")
Data4<-rbind(Data2, Data3)

#Sys.setlocale(locale = "USA")
date.time<-paste(Data4$Date, Data4$Time, sep=" ")
x<-strptime(date.time, "%d/%m/%Y %H:%M:%S")
y1<-as.numeric(Data4$Sub_metering_1)
y2<-as.numeric(Data4$Sub_metering_2)
y3<-Data4$Sub_metering_3

library("ggplot2")
png("plot3.png", width=480, height=480)
plot(x, y1, type="l", col="black", ylab = "Energy Sub metering")
lines(x, y2, type="l", col="red")
lines(x, y3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=2, col=c("black", "red", "blue"))


dev.off()
