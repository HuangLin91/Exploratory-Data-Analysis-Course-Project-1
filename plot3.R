## plot3
## Energy submetering

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
tmp <- paste(as.character(proj1$Date), proj1$Time, sep=" ")

# plot data in "plot2.png" file
png("plot3.png")
plot(as.POSIXct(tmp),proj1$Sub_metering_1, 
     xlab="", type="l", ylab="Energy sub metering")
# add more lines to the same plot
lines(as.POSIXct(tmp),proj1$Sub_metering_2,col="red")
lines(as.POSIXct(tmp),proj1$Sub_metering_3,col="blue") 
# add a legend 
legend("topright", cex=1, col=c("black", "red", "blue"), 
       lwd=1,y.intersp=1,xjust=1,text.width = strwidth("Sub_metering_1"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
