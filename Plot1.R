

#Downloading and preparing data
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,"household_power_consumption.zip" )
unzip("household_power_consumption.zip")
dir () # Verifies the contents extracted from the zip file
hpc <-read.table ("household_power_consumption.txt", header = TRUE, sep = ";",
                  na.strings= "?", stringsAsFactors = FALSE)
hpc2days <- subset (hpc, Date == "1/2/2007" | Date == "2/2/2007")
Datehpc2days <- strptime (hpc2days$Date, "%d/%m/%Y")
## Plot 1
png (file= "plot1.png", bg = "transparent")
hist (hpc2days$Global_active_power, col = "red", main="Global Active Power",
      xlab= "Global Active Power (kilowatts)")

dev.off()
