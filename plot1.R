#Data preparation

pow<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")
pow$Date_str<-strptime(paste(pow$Date,pow$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
power<-pow[pow$Date_str > strptime("2007-02-01 00:00:00",format="%Y-%m-%d %H:%M:%S") & pow$Date_str < strptime("2007-02-02 23:59:59",format="%Y-%m-%d %H:%M:%S"),]
power<-power[!is.na(power$Date),]


## Plot1 code

hist(as.numeric(power$Global_active_power),breaks=25,xlab="Global Active Power(kilowatts)", main="Global Active Power",col=rgb(255,0,0,maxColorValue=255))




