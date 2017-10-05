#### 1. Install packages & Excuting library) 
install.packages("twitteR")
library(twitteR)
install.packages("RCurl")
library(RCurl)
install.packages("ROAuth")
library(ROAuth)

#### 2. gaining OAuth; for this step, you need to obtain Twitter Account and Auth,  ##
requestURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
consumerKey="k1us307eiIZUO10DTxCKta3Zf"
consumerSecret="9LNcuh9zsTe437URfKsiYGNWVHBkRpz3JephcwguLju4yZJ7d1"
accesstoken="911048442927108096-h8ttX7z7WkbC4DtyGkvbVZdF1tpyUsG"
accesstokensecret="eGgMyqUn7kdZ1RvCb8lS4Ab9yHEMzJDtQhPRIQ6iVD3eH"
twitteR:::setup_twitter_oauth(consumerKey, consumerSecret, accesstoken, accesstokensecret)

twitCred <- OAuthFactory$new(consumerKey=consumerKey,
                             consumerSecret=consumerSecret,
                             requestURL=requestURL,
                             accessURL=accessURL,
                             authURL=authURL)

download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")
twitCred$handshake(cainfo="cacert.pem")

#### 4. gaining OAuth; start Function Test for Movie tweets gethering  =====
iphoneXTweets<-searchTwitter("#iphoneX",lang = "en", n=1000) 

#### 5. transform from List to DataFrame =====
iphoneXTweets.df=twListToDF(iphoneXTweets)

#### 6. view DataFrame =====
View(iphoneXTweets.df)

#### 7. down load as csv file  =====
write.csv(iphoneXTweets.df, file="C:\\Saipriya\\Studies\\Fall 2017\\WebAnalytics\\Exercise 3\\iphoneXTweets.df.csv", row.names=F)

#### 8. save R.Data  =====
save.image("C:\\Saipriya\\Studies\\Fall 2017\\WebAnalytics\\Exercise 3\\windowsTweets.RData") 
#### End
