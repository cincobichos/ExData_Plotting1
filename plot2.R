##Plot 2
#Downloading and preparing data
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,"household_power_consumption.zip" )
unzip("household_power_consumption.zip")
dir () # Verifies the contents extracted from the zip file
hpc <-read.table ("household_power_consumption.txt", header = TRUE, sep = ";"
                  , na.strings= "?", stringsAsFactors = FALSE)
hpc2days <- subset (hpc, Date == "1/2/2007" | Date == "2/2/2007")
Datehpc2days <- strptime (hpc2days$Date, "%d/%m/%Y")
#Plot 2
png (file= "plot2.png", bg = "transparent")
with (hpc2days, plot (Global_active_power, type = "l", xlab= " ",  
                      xaxt = "n", ylab= "Global Active Power (kilowatts)"), lty =1)

axis(1, at=c(0, 1440, 2880), labels= c("Thu", "Fri", "Sat"), pos= -0.1, lty= 1, col= "black")

dev.off()
