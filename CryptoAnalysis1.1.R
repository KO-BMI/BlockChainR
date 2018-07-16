#====================================================
library(coinmarketcapr)
library(formatR)
library(yaml)
library(googleVis)
library(knitr)
op <- options(gvis.plot.tag="chart")
#====================================================
top_cc <- get_marketcap_ticker_all()
kable(head(top_cc))


#====================================================


mapply(class,top_cc)


#====================================================
for(i in c(4:ncol(top_cc))) {
  top_cc[,i] <- as.double(top_cc[,i])
}

#====================================================
mark <- gvisColumnChart(top_cc[1:15, ], "name", "market_cap_usd", options = list(title = "Market Cap Of Leading Cryptocurrencies", 
                                                                                 legend = "left"))
plot(mark)

cat(mark$html$chart, file = "g1.html") # this store a html with g1 graph.
#====================================================




#====================================================
#Variations in Price
#====================================================

var <- gvisColumnChart(top_cc[1:15, ], "name", c("percent_change_1h", "percent_change_24h", 
                                                 "percent_change_7d"), options = list(title = "% change of prices", legend = "top"))
plot(var)

#====================================================