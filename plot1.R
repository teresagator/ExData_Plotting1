plot1 <- function() {
energy <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
energy$Date <- as.Date(energy$Date, "%d/%m/%Y")
Feb <- energy[which(energy$Date >= "2007-02-01" & energy$Date <= "2007-02-02"),]

png(filename="plot1.png", width=480, height=480, units="px")
hist(Feb$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowats)", col="red")
dev.off()
}