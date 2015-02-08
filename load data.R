library(lubridate)

# Downloading and extracting the dataset if not yet performed 
if (!file.exists("household_power_consumption.txt")){
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, destfile = "Dataset.zip")
    unzip("Dataset.zip")
}

power_set<-read.table("household_power_consumption.txt", header = T,sep = ";", na.strings = "?",colClasses=c(rep('character', 2), 
                                                                                                             rep('numeric', 7)))

# Re-format of date and time using the lubridate package
power_set$Date <-dmy(power_set$Date)
power_set$Time <-hms(power_set$Time)
power_set$Date.Time <- power_set$Date + power_set$Time

power_set$Date.Time<-strptime(power_set$Date.Time,format = "%Y-%m-%d %H:%M:%S")


tidy_set <-subset(power_set, Date>"2007-02-01"&Date<"2007-02-03")
