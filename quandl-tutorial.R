#retrieve the currency rates in US dollars for 
#the 22 major currencies listed on the Exchange rates page
#basics of calling the Quandl API


# Code for Quandl Blog Post
# June 2013# Joseph B Rickert
# This code uses the Quandl API to pull down
# exchange rate information from the Quandl currencies page
# The first step in running this script is to sign up at www.Quandl.com
# to get an authentication token

library(Quandl)
library(ggplot2)
library(reshape2)

Quandl.auth(Token) #Authenticate user token

# Build vector of currencies
currencies <- c("ARS","AUD","BRL","CAD","CHF",
	"CNY","DKK","EUR","GBP","IDR","ILS","INR",
	"JPY","MXN","MYR","NOK","NZD","PHP","RUB",
	"SEK","THB","TRY")

# Function to fetch major currency rates
rdQcurr <- function(curr){
	#construct Quandl code for first currency
	# why have to get first first?
	codes <- paste("QUANDL/",curr,"USD",sep="") # against USD
	for (i in 1 : length(curr)){
		if(i == 1){
			d <- Quandl(codes[1],start_date = "2000-01-01",
				end_date = "2013-06-07")[,1]
			A <- array(0,dim =c(length(d),length(codes)))
			#get rate from first currency
			A[,1] <- Quandl(codes[1],start_date="2000-01-01",end_date="2013-06-07")[,2]		
		}
		else{
			# Just get the rates for the remaining currencies
			A[,i] <- Quandl(codes[i],start_date="2000-01-01",end_date="2013-06-07")[,2]

		}
	}
	df <- data.frame(d,A)
	names(df) <- c("DATE",curr)
	return(df)
}


rates <- rdQcurr(currencies)# Fetch the currency rates
rates$DATE <- as.Date(rates$DATE)
rates4 <- rates[,c(1,3:6)]# Pick out some rates to plot
meltdf <- melt(rates4,id="DATE")# Shape data for plottting#

ggplot(meltdf,aes(x=DATE,y=value,colour=variable,group=variable)) +        geom_line() +   scale_colour_manual(values=1:22)+   ggtitle("Major Currency Exchange Rates in USD")


#Quandl API will also allow you to download data as a time series object
JPY = Quandl("QUANDL/USDJPY",start_date="2000-01-01",end_date="2013-06-07", type="xts")
class(JPY)
head(JPY)





