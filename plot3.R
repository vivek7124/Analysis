#Data preparation

pow<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")
pow$Date_str<-strptime(paste(pow$Date,pow$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
power<-pow[pow$Date_str > strptime("2007-02-01 00:00:00",format="%Y-%m-%d %H:%M:%S") & pow$Date_str < strptime("2007-02-02 23:59:59",format="%Y-%m-%d %H:%M:%S"),]
power<-power[!is.na(power$Date),]

## Plot 3 code

plot(strptime(power$Date_str,format="%Y-%m-%d %H:%M:%S"),power$Sub_metering_1,type="n",xlab="",ylab="Energy Sub Metering")
lines(strptime(power$Date_str,format="%Y-%m-%d %H:%M:%S"),col="black",power$Sub_metering_1)
lines(strptime(power$Date_str,format="%Y-%m-%d %H:%M:%S"),col="red",power$Sub_metering_2)
lines(strptime(power$Date_str,format="%Y-%m-%d %H:%M:%S"),col="blue",power$Sub_metering_3)
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))