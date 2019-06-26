getwd()
setwd("D://DataSienceCoursera//Course4")
getwd()
MyData <- read.csv(file="D:/DataSienceCoursera/Course4/exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=",")
head(MyData)
nrow(MyData)


library(data.table)
newFile <- fread("D:/DataSienceCoursera/Course4/exdata_data_household_power_consumption/household_power_consumption.txt", na.strings = "?")
nrow(newFile)
newFile[,DateTime := strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S") ]


install.packages("dplyr")


library(dplyr)
subsetted <- filter(newFile, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-02 00:00:00"))
 sss<- strptime(paste(subsetted$Date, subsetted$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
View(sss)
subsetted$Time <- sss
View(subsetted)
#View(subsetted)
nrow(subsetted)
nrow(MyData)
  
 
plot(subsetted$Time, subsetted$Global_active_power, type="l",
     
     ylab="Global Active Power (kilowatts)")

 