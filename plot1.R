getwd()
setwd("D://DataSienceCoursera//Course4")
getwd()
MyData <- read.csv(file="D:/DataSienceCoursera/Course4/exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=",")
head(MyData)
nrow(MyData)


library(data.table)
newFile <- fread("D:/DataSienceCoursera/Course4/exdata_data_household_power_consumption/household_power_consumption.txt", na.strings = "?")
nrow(newFile)
newFile[,DateTime := as.Date(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
install.packages("dplyr")


library(dplyr)
subsetted <- filter(newFile, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-02 00:00:00"))
#View(subsetted)
nrow(subsetted)
nrow(MyData)

par("mar") 
 # histogram with added parameters
hist(subsetted$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power(kilowatts)",
      col="red",
     freq=FALSE
)