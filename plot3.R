# Pre-requirement of this script is the launch of the "load data.R" script at the same directory

# Creating the png file with the specific format
png('plot3.png',width = 480, height = 480,)

plot(tidy_set$Date.Time, tidy_set$Sub_metering_1, type='l',
     xlab='', ylab='Energy sub metering')

# Setting up lines
lines(tidy_set$Date.Time, tidy_set$Sub_metering_2, col='red')
lines(tidy_set$Date.Time, tidy_set$Sub_metering_3, col='blue')
# Identifying the different lines
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid')

dev.off()
