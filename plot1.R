data <- read.table('data.txt',
                   header = TRUE,
                   sep = ';',
                   colClasses = c('character', 'character', rep('numeric', 7)),
                   na.strings = '?')

ds <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
ds$Time <- strptime(paste(ds$Date, ds$Time), '%d/%m/%Y %T')
ds[,'Date'] <- as.Date(ds[,'Date'], '%d/%m/%Y')

png('plot1.png')
hist(ds$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.off()