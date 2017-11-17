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
png(file = "plot3.png", width = 480, height = 480)
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(dat$DateTime,dat$Sub_metering_1,type="l",xlab='',ylab="Energy Sub Metering",col=columnlines[1])
lines(dat$DateTime,dat$Sub_metering_2,col=columnlines[2])
lines(dat$DateTime,dat$Sub_metering_3,col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")
dev.off()
