data <- read.table('data.txt',
                   header = TRUE,
                   sep = ';',
                   colClasses = c('character', 'character', rep('numeric', 7)),
                   na.strings = '?')

ds <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
ds$Time <- strptime(paste(ds$Date, ds$Time), '%d/%m/%Y %T')
ds[,'Date'] <- as.Date(ds[,'Date'], '%d/%m/%Y')

png('plot3.png')
plot(ds$Time, ds$Sub_metering_1, type = 'l', col = 'black', xlab = '', ylab = 'Energy sub metering')
lines(ds$Time, ds$Sub_metering_2, col = 'red')
lines(ds$Time, ds$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1)

dev.off()