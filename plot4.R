library(lubridate)

df <- read.table("Data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df$Date <- dmy(df$Date)
dates <- df$Date <= "2007-02-02" & df$Date >= "2007-02-01"
df1 <- df[dates,]
datetime <- paste(df1$Date, df1$Time)
df1$datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(df1$Global_active_power~df1$datetime, type="l", ylab="Global Active Power", xlab="")

plot(df1$Voltage~df1$datetime, type="l", ylab="Voltage", xlab="")

plot(df1$Sub_metering_1~df1$datetime, type="l", ylab="Energy sub metering", xlab="")
lines(df1$Sub_metering_2~df1$datetime,col='Red')
lines(df1$Sub_metering_3~df1$datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(df1$Global_reactive_power~df1$datetime, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()