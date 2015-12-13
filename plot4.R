# Reading the file taking care about separators, NAs, and only the rows of the two first days of February
datos <- read.table("./data/household_power_consumption.csv", sep=";", dec=".", 
                    na.strings = "?", numerals="no.loss", skip=66637, nrows=2880, 
                    col.names=c("Date","Time","Global_active_power",
                                "Global_reactive_power","Voltage",
                                "Global_intensity","Sub_metering_1",
                                "Sub_metering_2","Sub_metering_3"))
# Converting the factor column Date to Class Date
datos$Date <- as.Date(datos$Date,"%d/%m/%Y")

##################################################################################
# Plotting
##################################################################################
par(mfrow=c(2,2))

# Plot at position (1,1) 
with(datos,plot(datos$Global_active_power, type="l", xlab="", ylab="Global Active Power"))
axis(3,at=c(1,1440,2880), labels = c("Thu","Fri","Sat"))

# Plot at position (1,2) 
with(datos,plot(datos$Voltage, type="l", xlab="datetime", ylab="Voltage"))
axis(3,at=c(1,1440,2880), labels = c("Thu","Fri","Sat"))

# Plot at position (2,1) 
with(datos,plot(datos$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",
                col="black"))
with(datos,lines(datos$Sub_metering_2, type="l", xlab="", ylab="Energy sub metering",
                 col="red"))
with(datos,lines(datos$Sub_metering_3, type="l", xlab="", ylab="Energy sub metering",
                 col="blue"))
axis(3,at=c(1,1440,2880), labels = c("Thu","Fri","Sat")) 
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),pch="_", text.width=1000)

# Plot at position (2,2) 
with(datos,plot(datos$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
axis(3,at=c(1,1440,2880), labels = c("Thu","Fri","Sat"))

# Copying the plot to a PNG file
dev.copy(png,file="./data/plot4.png")
# Closing the PNG device
dev.off()

