
# setwd("./git/ExData_Plotting1")

###################################
# Prepare Data
###################################
filepath <- "../data/household_power_consumption.txt"

power <- read.table(filepath,sep=";",header=T, stringsAsFactors = F)
power$Date2 <- as.POSIXct(paste(power$Date,power$Time),format="%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date,"%d/%m/%Y")
power <- power[power$Date >= as.Date("2007-02-01","%Y-%m-%d") & power$Date <= as.Date("2007-02-02","%Y-%m-%d"), ]

# summary(power)

power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)

###################################
# CREATE PLOT 3
###################################

with( power,plot(Date2,Sub_metering_1, type="n",xlab="", ylab="Energy sub metering"))
with( power,lines(Date2,Sub_metering_1, col="black"))
with( power,lines(Date2,Sub_metering_2, col="red"))
with( power,lines(Date2,Sub_metering_3, col="blue"))
legend("top", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=2, col=c("black","red","blue"), bty="n")


#dev.cur()
dev.copy(device=png,filename="plot3.png", width=480, height=480)
dev.off()


##################################
# CLEANUP
##################################
rm(power)