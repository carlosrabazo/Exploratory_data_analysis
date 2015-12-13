# Reading the file taking care about separators, NAs, and only the rows of the two first days of February
datos <- read.table("./data/household_power_consumption.csv", sep=";", dec=".", 
                    na.strings = "?", numerals="no.loss", skip=66637, nrows=2880, 
                    col.names=c("Date","Time","Global_active_power",
                                "Global_reactive_power","Voltage",
                                "Global_intensity","Sub_metering_1",
                                "Sub_metering_2","Sub_metering_3"))
# Converting the factor column Date to Class Date
datos$Date <- as.Date(datos$Date,"%d/%m/%Y")
# Plotting 
with(datos,plot(datos$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
axis(3,at=c(1,1440,2880), labels = c("Thu","Fri","Sat"))
# Copying the plot to a PNG file
dev.copy(png,file="./data/plot2.png")
# Closing the PNG device
dev.off()


