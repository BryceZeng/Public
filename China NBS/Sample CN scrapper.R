library(dplyr)

#Get the current time in UNIX time
current_time <- round(as.numeric(as.POSIXct(Sys.time()))*1000,0)

#Generate the list of codes, it will start with A010101...A0Exxxx in hex number
#For my case, I am only getting a single value
code <- 'A0B0101'

#Query from NBC
url <- paste0('http://data.stats.gov.cn/english/easyquery.htm?m=QueryData&dbcode=hgyd&rowcode=zb&colcode=sj&wds=%5B%5D&dfwds=%5B%7B%22wdcode%22%3A%22zb%22%2C%22valuecode%22%3A%22',
              code,'%22%7D%5D&k1=',current_time)

#Get and phrase the json
data <- RCurl::getURL(url) %>% jsonlite::fromJSON()

# Making it into a dataframe
df <-  data.frame(data$returndata[[1]])
