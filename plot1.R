Data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
library("dplyr")
Data2<-filter(Data, Date=="2007-02-01")
Data3<-filter(Data, Date=="2007-02-02")
Data4<-rbind(Data2, Data3)
P1<-select(Data4, Global_active_power)
P1.0<-P1$Global_active_power
P1.1<-levels(P1.0)
P1.2<-as.numeric(P1.1)
good<-!is.na(P1.2)
P1.3<-P1.2[good]
library("ggplot2")
hist(P1.3, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()

