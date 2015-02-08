library(lubridate)

power_set<-read.table("household_power_consumption.txt", header = T,sep = ";", na.strings = "?",colClasses=c(rep('character', 2), 
                                                                                                             rep('numeric', 7)))

# Re-format of date and time using the lubridate package
power_set$Date <-dmy(power_set$Date)
power_set$Time <-hms(power_set$Time)
power_set$Date.Time <- power_set$Date + power_set$Time

power_set$Date.Time<-strptime(power_set$Date.Time,format = "%Y-%m-%d %H:%M:%S")

tidy_set <-subset(power_set, Date>"2007-02-01"&Date<"2007-02-03")

png('plot4.png',width = 480, height = 480,)

## Make plots
par(mfrow=c(2,2))

# Top left
plot(tidy_set$Date.Time, tidy_set$Global_active_power,
     ylab='Global Active Power', xlab='', type='l')

# Top right
plot(tidy_set$Date.Time, tidy_set$Voltage,
     xlab='datetime', ylab='Voltage', type='l')

# Bottom left
plot(tidy_set$Date.Time, tidy_set$Sub_metering_1, type='l',
     xlab='', ylab='Energy sub metering')
lines(tidy_set$Date.Time, tidy_set$Sub_metering_2, col='red')
lines(tidy_set$Date.Time, tidy_set$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid', bty='n')

# Bottom right
plot(tidy_set$Date.Time, tidy_set$Global_reactive_power,
     xlab='datetime', ylab='Global_reactive_power', type='l')

# Turn off device
dev.off()