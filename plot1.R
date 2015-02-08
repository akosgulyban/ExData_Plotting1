# Pre-requirement of this script is the launch of the "load data.R" script at the same directory

# Creating the png file with the specific format
png('plot1.png',width = 480, height = 480,)

# Generating the histogram
hist(tidy_set$Global_active_power, main='Global Active Power', 
           xlab='Global Active Power (kilowatts)', col='red')
dev.off()
