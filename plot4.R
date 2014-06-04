plot4 <- function() {
  energy_2007 <- read.table("household_power_consumption_2007.txt", header=TRUE, sep=";", na.strings="?")
  energy_2007$Date <- as.Date(energy_2007$Date, "%d/%m/%Y")
  Feb <- energy_2007[which(energy_2007$Date >= "2007-02-01" & energy_2007$Date <= "2007-02-02"),]
  Feb$DateTime <- paste(Feb$Date, Feb$Time)
  Feb$DateTime <- strptime(Feb$DateTime, format="%Y-%m-%d %H:%M:%S")
  
  png(filename="plot4.png", width=480, height=480, units="px")
  par(mfrow=c(2,2))
  ## 0,0
  plot(Feb$DateTime, Feb$Global_active_power, type="l", ylab="Global Active Power", xlab="")
  
  ## 0,1
  plot(Feb$DateTime, Feb$Voltage, type="l", ylab="Voltage", xlab="datetime")
  
  ## 1,0
  plot(Feb$DateTime, Feb$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  points(Feb$DateTime, Feb$Sub_metering_2, type="l", col="red")
  points(Feb$DateTime, Feb$Sub_metering_3, type="l", col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", lty=c(1,1), col=c("black", "red", "blue"))

  ## 1,1
  plot(Feb$DateTime, Feb$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
  dev.off()
}