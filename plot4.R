

data <- read.csv("household_power_consumption.txt",sep=';')
dataF <- data
dataF$Date <- as.Date(dataF$Date,format="%d/%m/%Y")

dataF2  <- dataF[dataF$Date == as.Date("2007-02-01") | dataF$Date ==  as.Date("2007-02-02"),]
dataF2$Global_active_power <- as.numeric(as.character(dataF2$Global_active_power))
dataF2$Sub_metering_1 <- as.numeric(as.character(dataF2$Sub_metering_1))
dataF2$Sub_metering_2 <- as.numeric(as.character(dataF2$Sub_metering_2))
dataF2$Sub_metering_3 <- as.numeric(as.character(dataF2$Sub_metering_3))
dataF2$Voltage <- as.numeric(as.character(dataF2$Voltage))
dataF2$Global_reactive_power <- as.numeric(as.character(dataF2$Global_reactive_power))

textSize = 0.8
titleSize = 1
legSize = 0.7

attach(mtcars)
par(mfrow=c(2,2))


plot(dataF2$Global_active_power, type='n' ,   axes=FALSE,
     ylab="Global Active Power",xlab='', 
     cex.axis=textSize, cex.lab=textSize, cex.main=titleSize)
axis(side=2, at=seq(0, 6, by=2), cex.axis=textSize)
axis(side=1, at=c(0, 1440, 2880) , labels=c('Thu','Fri','Sat'),cex.axis=textSize)
lines(dataF2$Global_active_power)
box()


plot(dataF2$Voltage, type='n' ,   axes=FALSE,
     ylab="Voltage",xlab='', 
     cex.axis=textSize, cex.lab=textSize, cex.main=titleSize)
axis(side=2, at=seq(234, 246, by=4), cex.axis=textSize)
axis(side=1, at=c(0, 1440, 2880) , labels=c('Thu','Fri','Sat'),cex.axis=textSize)
lines(dataF2$Voltage)
box()


plot(dataF2$Sub_metering_1, type='n' ,   axes=FALSE,
     ylab="Energy sub metering",xlab='', width=480,height=480,
     cex.axis=textSize, cex.lab=textSize, cex.main=titleSize)
axis(side=2, at=seq(0, 30, by=10), cex.axis=textSize)
axis(side=1, at=c(0, 1440, 2880) , labels=c('Thu','Fri','Sat'),cex.axis=textSize)
lines(dataF2$Sub_metering_1)
lines(dataF2$Sub_metering_2,col='red')
lines(dataF2$Sub_metering_3,col='blue')
box()
legend("topright", # places a legend at the appropriate place 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), # puts text in the legend 
       #lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       lwd=c(2.5,2.5,2.5),
       col=c("black","blue","red"),
       pt.cex = legSize, cex=legSize,
       bty='n'
)


plot(dataF2$Global_reactive_power, type='n' ,   axes=FALSE,
     ylab="Global_reactive_power",xlab='', 
     cex.axis=textSize, cex.lab=textSize, cex.main=titleSize)
axis(side=2, at=seq(0, 0.5, by=0.1), cex.axis=textSize)
axis(side=1, at=c(0, 1440, 2880) , labels=c('Thu','Fri','Sat'),cex.axis=textSize)
lines(dataF2$Global_reactive_power)
box()


dev.copy(png,"plot4.png",width=480,height=480,units="px",res=100)
dev.off()
