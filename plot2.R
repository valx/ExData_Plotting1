data <- read.csv("household_power_consumption.txt",sep=';')
dataF <- data
dataF$Date <- as.Date(dataF$Date,format="%d/%m/%Y")
dataF2  <- dataF[dataF$Date == as.Date("2007-02-01") | dataF$Date ==  as.Date("2007-02-02"),]
dataF2$Global_active_power <- as.numeric(as.character(dataF2$Global_active_power))



plot(dataF2$Global_active_power, type='n' ,   axes=FALSE,
     ylab="Global Active Power (kilowatts)",xlab='', 
     cex.axis=0.6, cex.lab=0.6, cex.main=0.7)
axis(side=2, at=seq(0, 6, by=2), cex.axis=0.6)
axis(side=1, at=c(0, 1440, 2880) , labels=c('Thu','Fri','Sat'),cex.axis=0.6)
lines(dataF2$Global_active_power)
box()
dev.copy(png,"plot2.png",width=480,height=480,units="px",res=100)
dev.off()

