# Pre-requirement of this script is the launch of the "load data.R" script at the same directory

# Creating the png file with the specific format
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
