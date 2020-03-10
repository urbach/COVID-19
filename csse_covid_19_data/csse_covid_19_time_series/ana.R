xdatar <- read.csv("time_series_19-covid-Recovered.csv")
xdatad <- read.csv("time_series_19-covid-Deaths.csv")
xdata <- read.csv("time_series_19-covid-Confirmed.csv")

N <- dim(xdata)[2]

tikzfiles <- tikz.init(basename="COVID19", width=4, height=4.5)

plot(y=as.vector(xdata[xdata$Country.Region=="Germany",])[4:N], x=c(4:N), log="y", type='l',
     xlab=c("Time/days"), ylab="Cases")
lines(y=as.vector(xdatar[xdata$Country.Region=="Germany",])[4:N], x=c(4:N), col="red")
lines(y=as.vector(xdatad[xdata$Country.Region=="Germany",])[4:N], x=c(4:N), col="blue")
legend("topleft",
       legend=c("Confirmed", "Recovered", "Deaths"),
       bty="n",
       col=c("black","red", "blue"),
       lty=c(1,1, 1))

plot(y=as.vector(xdata[xdata$Country.Region=="Italy",])[4:N], x=c(4:N),
     log="y", type='l', ylim=c(1,10000),
     xlab=c("Time/days"), ylab="Cases")
lines(y=as.vector(xdata[xdata$Country.Region=="Germany",])[4:N], x=c(4:N), col="red", lty=2)
lines(y=as.vector(colSums(xdata[xdata$Country.Region=="US",4:N])), x=c(4:N), col="blue", lty=3)
lines(y=as.vector(xdata[xdata$Country.Region=="South Korea",])[4:N], x=c(4:N), col="darkorange", lty=4)
lines(y=as.vector(xdata[xdata$Country.Region=="France",])[4:N], x=c(4:N), col="darkgreen", lty=5)
lines(y=as.vector(xdata[xdata$Country.Region=="Japan",])[4:N], x=c(4:N), col="grey", lty=6)
legend("topleft",
       legend=c("Italy", "Germany", "US", "South Korea", "France", "Japan"),
       bty="n",
       col=c("black","red", "blue", "darkorange", "darkgreen", "grey"),
       lty=c(1:6))

plot(y=as.vector(xdatad[xdatad$Country.Region=="Italy",])[4:N], x=c(4:N),
     log="y", type='l', ylim=c(1,1000),
     xlab=c("Time/days"), ylab="Deaths")
lines(y=as.vector(xdatad[xdatad$Country.Region=="Germany",])[4:N], x=c(4:N), col="red", lty=2)
lines(y=as.vector(colSums(xdatad[xdatad$Country.Region=="US",4:N])), x=c(4:N), col="blue", lty=3)
lines(y=as.vector(xdatad[xdatad$Country.Region=="South Korea",])[4:N], x=c(4:N), col="darkorange", lty=4)
lines(y=as.vector(xdatad[xdatad$Country.Region=="France",])[4:N], x=c(4:N), col="darkgreen", lty=5)
legend("topleft",
       legend=c("Italy", "Germany", "US", "South Korea", "France"),
       bty="n",
       col=c("black","red", "blue", "darkorange", "darkgreen"),
       lty=c(1:5))

tikz.finalize(tikzfiles)
