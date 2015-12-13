# Reading the file taking care about separators, NAs, and only the rows of the two first days of February
datos <- read.table("./data/household_power_consumption.csv", sep=";", dec=".", 
                    na.strings = "?", numerals="no.loss", skip=66637, nrows=2880, 
                    col.names=c("Date","Time","Global_active_power",
                                "Global_reactive_power","Voltage",
                                "Global_intensity","Sub_metering_1",
                                "Sub_metering_2","Sub_metering_3"))
# Plotting the Histogram taking care about the colour, the labels and the title
hist(datos$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
# Copying the plot to a PNG file
dev.copy(png,file="./data/plot1.png")
# Closing the PNG device
dev.off()