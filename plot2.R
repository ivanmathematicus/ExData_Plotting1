#Calculating memory requirements
2075259* 9 * 8/1073741824
#0.139157 GB
#Load the data
initial <- read.table('household_power_consumption.txt', header=TRUE, nrow=2, 
                      sep=';', as.is=TRUE)
classes <- sapply(initial, class)
data <- read.table('household_power_consumption.txt', header=TRUE, sep=';', 
                   as.is=TRUE, colClasses = classes, na.strings = "?")

# extract the data from 2007-02-01 to 2007-02-02
index <- data[,1]=='1/2/2007' | data[,1]=='2/2/2007'
data <- data[index,]


#Used reference:https://stat.ethz.ch/pipermail/r-help/2004-September/057069.html

#Plot2
png(filename = "plot2.png")

# Create plot with no x axis and no x axis label
plot(seq_along(data[,"Global_active_power"]),data[,"Global_active_power"], 
     type = 'line', xaxt = 'n', ylab = "Global Active Power (kilowatts)",
     xlab = NA)
# Set up x axis with tick marks alone
axis(side = 1, at = seq(0, max(seq_along(data[,"Global_active_power"])),
                        length = 3),labels= FALSE)
# Create labels
labels <- c('Thu', 'Fri', 'Sat')
# plot x axis labels using:
# par("usr")[3] - 0.5 as the vertical placement
# xpd = TRUE to allow for text outside the plot region
text(seq(0, max(seq_along(data[,"Global_active_power"])),length = 3),
     par("usr")[3] - 0.5, labels = labels, xpd = TRUE)

dev.off()
