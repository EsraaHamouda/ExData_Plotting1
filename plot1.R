
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

hist(subsetted$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power(kilowatts)",
     col="red")