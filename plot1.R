data <- read.csv("household_power_consumption.txt",sep=';')
dataF <- data
dataF$Date <- as.Date(dataF$Date,format="%d/%m/%Y")
dataF2  <- dataF[dataF$Date == as.Date("2007-02-01") | dataF$Date ==  as.Date("2007-02-02"),]
dataF2$Global_active_power <- as.numeric(as.character(dataF2$Global_active_power))
hist(dataF2$Global_active_power, breaks=12, 
     col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     cex.axis=0.6, cex.lab=0.6, cex.main=0.7)
dev.copy(png,"plot1.png",width=480,height=480,units="px",res=100)
dev.off()
