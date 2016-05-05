
# setwd("./git/ExData_Plotting1")

###################################
# Prepare Data
###################################
filepath <- "../data/household_power_consumption.txt"

power <- read.table(filepath,sep=";",header=T, stringsAsFactors = F)
power$Date <- as.Date(power$Date,"%d/%m/%Y")
power <- power[power$Date >= as.Date("2007-02-01","%Y-%m-%d") & power$Date <= as.Date("2007-02-02","%Y-%m-%d"), ]

# summary(power)

power$Global_active_power <- as.numeric(power$Global_active_power)

###################################
# CREATE PLOT 1
###################################

with(power,hist(Global_active_power, col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power"))

#dev.cur()

png(filename="plot1.png", width=480, height=480)
with(power,hist(Global_active_power, col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.off()

##################################
# CLEANUP
##################################
rm(power)