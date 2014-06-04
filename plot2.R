plot2 <- function() {
  energy_2007 <- read.table("household_power_consumption_2007.txt", header=TRUE, sep=";", na.strings="?")
  energy_2007$Date <- as.Date(energy_2007$Date, "%d/%m/%Y")
  Feb <- energy_2007[which(energy_2007$Date >= "2007-02-01" & energy_2007$Date <= "2007-02-02"),]
  Feb$DateTime <- paste(Feb$Date, Feb$Time)
  Feb$DateTime <- strptime(Feb$DateTime, format="%Y-%m-%d %H:%M:%S")
  
  png(filename="plot2.png", width=480, height=480, units="px")
  plot(Feb$DateTime, Feb$Global_active_power, type="l", ylab="Global Active Power (kilowats)", xlab="")
  dev.off()
}