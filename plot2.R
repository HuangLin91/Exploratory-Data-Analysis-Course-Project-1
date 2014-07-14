## plot2
## Fluctuations of Global Active Power during the week 

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
head(proj1$Date)
#convert to "date time" string to be later converted as.POSIXct
tmp <- paste(as.character(proj1$Date), proj1$Time, sep=" ")
head(tmp)

# plot data in "plot2.png" file
png("plot2.png")
plot(as.POSIXct(tmp), proj1$Global_active_power, 
     xlab="", type="l", ylab="Global Active Power (kilowatts)")
dev.off()
