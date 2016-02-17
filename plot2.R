Data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
library("dplyr")
Data2<-filter(Data, Date=="1/2/2007")
Data3<-filter(Data, Date=="2/2/2007")
Data4<-rbind(Data2, Data3)

y<-as.numeric(Data4$Global_active_power)

#Sys.setlocale(locale = "USA")
date.time<-paste(Data4$Date, Data4$Time, sep=" ")
x<-strptime(date.time, "%d/%m/%Y %H:%M:%S")

library("ggplot2")
plot(x,y, type="l", ylab = "Global Active Power (kilowatts)")
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()
