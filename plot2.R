# Pre-requirement of this script is the launch of the "load data.R" script at the same directory

# Creating the png file with the specific format
png('plot2.png',width = 480, height = 480,)

plot(tidy_set$Date.Time, tidy_set$Global_active_power,
           ylab='Global Active Power (kilowatts)', xlab='', type='l')

dev.off()
