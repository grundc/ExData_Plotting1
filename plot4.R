
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

power$Global_active_power <- as.numeric(power$Global_active_power)
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Voltage <- as.numeric(power$Voltage)
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)

###################################
# CREATE PLOT 3
###################################

par(mfrow=c(2,2))

# ADD PLOT (1,1)
with( power,plot(Date2,Global_active_power, type="n",xlab="", ylab="Global Active Power (kilowatts)"))
with( power,lines(Date2,Global_active_power))

# ADD PLOT (1,2)
with( power,plot(Date2,Voltage, type="n",xlab="datetime", ylab="Voltage"))
with( power,lines(Date2,Voltage))

# ADD PLOT (2,1)
with( power,plot(Date2,Sub_metering_1, type="n",xlab="", ylab="Energy sub metering"))
with( power,lines(Date2,Sub_metering_1, col="black"))
with( power,lines(Date2,Sub_metering_2, col="red"))
with( power,lines(Date2,Sub_metering_3, col="blue"))
legend("top", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=2, col=c("black","red","blue"), bty="n", cex=0.5)


# ADD PLOT (2,2)
with( power,plot(Date2,Global_reactive_power, type="n",xlab="datetime", ylab="Global_reactive_power"))
with( power,lines(Date2,Global_reactive_power))

#dev.cur()
dev.copy(device=png,filename="plot4.png", width=480, height=480)
dev.off()


##################################
# CLEANUP
##################################
#rm(power)