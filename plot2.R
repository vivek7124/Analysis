#Data preparation

pow<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")
pow$Date_str<-strptime(paste(pow$Date,pow$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
power<-pow[pow$Date_str > strptime("2007-02-01 00:00:00",format="%Y-%m-%d %H:%M:%S") & pow$Date_str < strptime("2007-02-02 23:59:59",format="%Y-%m-%d %H:%M:%S"),]
power<-power[!is.na(power$Date),]

## Plot 2 code

plot(strptime(power$Date_str,format="%Y-%m-%d %H:%M:%S"),power$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
