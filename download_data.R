# Downloading and extracting the dataset if not yet performed 
if (!file.exists("household_power_consumption.txt")){
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, destfile = "Dataset.zip")
    unzip("Dataset.zip")
}