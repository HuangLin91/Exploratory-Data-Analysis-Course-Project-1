## plot4
## Different energy categories

# open .txt file for reading
tmp1 <- file("household_power_consumption.txt", "r")

# find the lines with dates 1/2/2007 through 2/2/2007, save as "proj1.txt"
cat(grep("(^Date)|(^[1|2]/2/2007)",readLines(tmp1), value=TRUE), sep="\n", file="proj1.txt")
close(tmp1)
# read the selected data into memory
proj1 <- read.table("proj1.txt", sep=";", header=TRUE, na.strings="?")
head(proj1)

# convert dates. NB capital "Y" because year=yyyy
proj1$Date <- as.Date(proj1$Date, "%d/%m/%Y")
#convert to "date time" string to be later converted as.POSIXct
datetime <- as.POSIXct(paste(as.character(proj1$Date), proj1$Time, sep=" "))

# plot data in "plot4.png" file
png("plot4.png")
par(mfrow=c(2,2))
# plot topleft
with(proj1, plot(datetime, Global_active_power, 
     xlab="", type="l", ylab="Global Active Power"))
# plot topright
with(proj1, plot(datetime,Voltage, type="l",ylab="Voltage"))
# plot bottom left
with(proj1, plot(datetime,Sub_metering_1, 
     xlab="", type="l", ylab="Energy sub metering"))
with(proj1,lines(datetime,Sub_metering_2,col="red"))
with(proj1,lines(datetime,Sub_metering_3,col="blue")) 
legend("topright", cex=1, col=c("black", "red", "blue"),lwd=2,bty="n",
       y.intersp=0.8,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# plot bottomright
with(proj1, plot(datetime, Global_reactive_power, type="l"))
dev.off()
