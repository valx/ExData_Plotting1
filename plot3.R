data <- read.csv("household_power_consumption.txt",sep=';')
dataF <- data
dataF$Date <- as.Date(dataF$Date,format="%d/%m/%Y")

dataF2  <- dataF[dataF$Date == as.Date("2007-02-01") | dataF$Date ==  as.Date("2007-02-02"),]
dataF2$Sub_metering_1 <- as.numeric(as.character(dataF2$Sub_metering_1))
dataF2$Sub_metering_2 <- as.numeric(as.character(dataF2$Sub_metering_2))
dataF2$Sub_metering_3 <- as.numeric(as.character(dataF2$Sub_metering_3))

plot(dataF2$Sub_metering_1, type='n' ,   axes=FALSE,
     ylab="Energy sub metering",xlab='', width=480,height=480,
     cex.axis=0.6, cex.lab=0.6, cex.main=0.7)
axis(side=2, at=seq(0, 30, by=10), cex.axis=0.6)
axis(side=1, at=c(0, 1440, 2880) , labels=c('Thu','Fri','Sat'),cex.axis=0.6)
lines(dataF2$Sub_metering_1)
lines(dataF2$Sub_metering_2,col='red')
lines(dataF2$Sub_metering_3,col='blue')
box()
legend("topright", # places a legend at the appropriate place 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), # puts text in the legend 
       #lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       lwd=c(2.5,2.5,2.5),
       col=c("black","blue","red"),
       pt.cex = 0.6, cex=0.6
)
dev.copy(png,"plot3.png",width=480,height=480,units="px",res=100)
dev.off()

