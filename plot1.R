Data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
library("dplyr")
Data2<-filter(Data, Date=="1/2/2007")
Data3<-filter(Data, Date=="2/2/2007")
Data4<-rbind(Data2, Data3)

x<-as.numeric(Data4$Global_active_power)

library("ggplot2")
hist(x, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()


