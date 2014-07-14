## plot1
## Global Active Power

# open .txt file for reading
tmp1 <- file("household_power_consumption.txt", "r")

# find the lines with dates 1/2/2007 through 2/2/2007, save as "proj1.txt"
cat(grep("(^Date)|(^[1|2]/2/2007)",readLines(tmp1), value=TRUE), sep="\n", file="proj1.txt")
close(tmp1)
# read the selected data into memory
proj1 <- read.table("proj1.txt", sep=";", header=TRUE, na.strings="?")
head(proj1)

# plot data into "plot1.png" file
png("plot1.png")
hist(proj1$Global_active_power, col="red", main="Global Active Power",
        xlab="Global Acitve Power (kilowatts)", ylab="Frequency")
dev.off()
