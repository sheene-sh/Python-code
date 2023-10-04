setwd("c:/Rtest")
getwd()

install.packages(c("twitteR","ROAuth", "base64enc"))

library(twitteR)
library(ROAuth)
library(base64enc)

consumerKey <- "YgQyxCAMX71V0ZepW2tJWZbfv"
consumerSecret <- "sVjmmi65dPLfLBFiCE2rCa04A1NwYrAVJshQ28N9RQx5aWa6Zm"
accessToken <- "738692752196521984-OOkKv7F4k3ay1xiIWspxTIEbqhj3phv"
accessTokenSecret <- "GrhYMkChCOdcMgCSuonMMjWeoQpyj7TFaWoGj6LmYMJmZ"

setup_twitter_oauth(consumerKey, consumerSecret, accessToken, accessTokenSecret)

keyword <- enc2utf8("bigdata")

bigdata <- searchTwitter(keyword, n=500, lang="ko")
length(bigdata)
head(bigdata)