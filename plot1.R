data <- read.csv("household_power_consumption.txt",sep=';')
dataF <- data
dataF$Date <- as.Date(dataF$Date,format="%d/%m/%Y")
dataF2  <- dataF[dataF$Date == as.Date("2007-02-01") | dataF$Date ==  as.Date("2007-02-02"),]
dataF2$Global_active_power <- as.numeric(as.character(dataF2$Global_active_power))
hist(dataF2$Global_active_power, breaks=12, col="red")
