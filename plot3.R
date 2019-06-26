 
MyData <- read.csv(file="D:/DataScienceCourse/exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=",")
head(MyData)
nrow(MyData)


library(data.table)
newFile <- fread("D:/DataScienceCourse/exdata_data_household_power_consumption/household_power_consumption.txt", na.strings = "?")

newFile[,DateTime :=  paste(Date, Time, sep=' ') ]
 subsetted <- filter(newFile, Date >= as.Date("1/2/2007"), Date < as.Date("2/2/2007"))

datetime <- strptime(paste(subsetted$Date, subsetted$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
 View(subsetted)
nrow(subsetted)
View(subsetted)

datetime <- strptime(subsetted$DateTime, "%d/%m/%Y %H:%M:%S")
datetime

plot(datetime,subsetted$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subsetted,lines(datetime,as.numeric(as.character(Sub_metering_1))))
with(subsetted,lines(datetime,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subsetted,lines(datetime,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

 