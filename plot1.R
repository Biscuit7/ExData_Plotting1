library(lubridate)

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df$Date <- dmy(df$Date)
dates <- df$Date <= "2007-02-02" & df$Date >= "2007-02-01"
df1 <- df[dates,]

par(mfrow=c(1,1))

hist(df1$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png,file="plot1.png", width=480, height=480)
dev.off()