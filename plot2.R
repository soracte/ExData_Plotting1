data <- read.table('data.txt',
                   header = TRUE,
                   sep = ';',
                   colClasses = c('character', 'character', rep('numeric', 7)),
                   na.strings = '?')

ds <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
ds$Time <- strptime(paste(ds$Date, ds$Time), '%d/%m/%Y %T')
ds[,'Date'] <- as.Date(ds[,'Date'], '%d/%m/%Y')

png('plot2.png')
plot(ds$Time, ds$Global_active_power, type = 'l', main = '', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()