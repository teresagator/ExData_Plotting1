plot3 <- function() {
  energy <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
  energy$Date <- as.Date(energy$Date, "%d/%m/%Y")
  Feb <- energy[which(energy$Date >= "2007-02-01" & energy$Date <= "2007-02-02"),]
  Feb$DateTime <- paste(Feb$Date, Feb$Time)
  Feb$DateTime <- strptime(Feb$DateTime, format="%Y-%m-%d %H:%M:%S")
  
  png(filename="plot3.png", width=480, height=480, units="px")
  plot(Feb$DateTime, Feb$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  points(Feb$DateTime, Feb$Sub_metering_2, type="l", col="red")
  points(Feb$DateTime, Feb$Sub_metering_3, type="l", col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))
  dev.off()
}