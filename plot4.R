 
MyData <- read.csv(file="D:/DataScienceCourse/exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=",")
head(MyData)
nrow(MyData)


library(data.table)
newFile <- fread("D:/DataScienceCourse/exdata_data_household_power_consumption/household_power_consumption.txt", na.strings = "?")

newFile[,DateTime :=  paste(Date, Time, sep=' ') ]
subsetted<-subset(newFile,newFile$Date=="1/2/2007"|newFile$Date=="2/2/2007")
#subsetted <- filter(newFile, Date >= as.Date("1/2/2007"), Date < as.Date("2/2/2007"))

datetime <- strptime(paste(subsetted$Date, subsetted$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#subsetted <- filter(newFile, Date >= as.Date("2/1/2007"), Date < as.Date("2/2/2007"))
View(subsetted)
nrow(subsetted)

View(subsetted)

datetime <- strptime(subsetted$DateTime, "%d/%m/%Y %H:%M:%S")
datetime

 
 with (
  subsetted,{
    
    plot(datetime, subsetted$Global_active_power, type="l",     ylab="Global Active Power (kilowatts)")
    plot(datetime, subsetted$Voltage, type="l",     ylab="Voltage")
    plot(datetime, subsetted$Sub_metering_1 , type="l",     ylab="Sub_metering_1")
    plot(datetime, subsetted$Global_reactive_power, type="l",     ylab="Global reActive Power (kilowatts)")
    
  }
  
)

 