setwd(paste("d:\\DataScience\\Exploratory\\week1\\",sep=''))
downloadURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloadFile <- "./Data/household_power_consumption.zip"
householdFile <- "./Data/household_power_consumption.txt"
##
if (!file.exists(householdFile)) {
  download.file(downloadURL, downloadFile, method = "curl")
  unzip(downloadFile, overwrite = T, exdir = "./Data")
}
plotData   <- read.table('household_power_consumption.txt', header = T, sep =';',na.strings = '?')
dat <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
dat$DateTime<-strptime(paste(dat$Date, dat$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
png(file = "plot2.png", width = 480, height = 480)
plot(dat$DateTime,dat$Global_active_power,type="l",xlab='',ylab="Global Active Power(kilowatts)")
dev.off()

