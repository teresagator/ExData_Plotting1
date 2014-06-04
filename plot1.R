plot1 <- function() {
energy_2007 <- read.table("household_power_consumption_2007.txt", header=TRUE, sep=";", na.strings="?")
energy_2007$Date <- as.Date(energy_2007$Date, "%d/%m/%Y")
Feb <- energy_2007[which(energy_2007$Date >= "2007-02-01" & energy_2007$Date <= "2007-02-02"),]

png(filename="plot1.png", width=480, height=480, units="px")
hist(Feb$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowats)", col="red")
dev.off()
}