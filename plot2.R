
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

###################################
# CREATE PLOT 2
###################################

with( power,plot(Date2,Global_active_power, type="n",xlab="", ylab="Global Active Power (kilowatts)"))
with( power,lines(Date2,Global_active_power))

#dev.cur()
dev.copy(device=png,filename="plot2.png", width=480, height=480)
dev.off()


##################################
# CLEANUP
##################################
rm(power)