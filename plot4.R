#Downloading and preparing data
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,"household_power_consumption.zip" )
unzip("household_power_consumption.zip")
dir () # Verifies the contents extracted from the zip file
hpc <-read.table ("household_power_consumption.txt", header = TRUE, sep = ";"
                  , na.strings= "?", stringsAsFactors = FALSE)
hpc2days <- subset (hpc, Date == "1/2/2007" | Date == "2/2/2007")
Datehpc2days <- strptime (hpc2days$Date, "%d/%m/%Y")
# Plot 4
png (file = "plot4.png", bg= "transparent")
par (mfrow = c(2,2))
#topleft
with (hpc2days, plot (Global_active_power,  type = "l", xlab = " ", xaxt= "n",
                      ylab= "Global Active Power (kilowatts)"))
axis(1, at=c(0, 1440, 2880), labels= c("Thu", "Fri", "Sat"), pos= -0.1, lty= 1, col= "black")

#topright
with (hpc2days, plot (Voltage, type= "l", ylab= "Voltage", xlab = "datetime"))
#bottonleft
with (hpc2days, plot (Sub_metering_1,  ylab= "Energy sub metering", xlab= " ", type = "n", xaxt= "n"))
points (hpc2days$Sub_metering_1,  type = "l", col="black")
points (hpc2days$Sub_metering_2,  type = "l", col="red")
points (hpc2days$Sub_metering_3,  type = "l", col="blue") 
axis(1, at=c(0, 1440, 2880), labels= c("Thu", "Fri", "Sat"), pos= -1.6, lty= 1, col= "black")

legend ("topright", lty= 1, col = c("black", "red", "blue"), 
        legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#bottonright
with (hpc2days, plot (Global_reactive_power, type= "l", ylab= "Global_reactive_power", xlab = "datetime"))

dev.off()


      