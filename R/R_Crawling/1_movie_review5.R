#crawling review on the movie,'the reader: a man reading a bool', ' 영화 '더리더:책 읽어주는  남자' 영화평 수집
setwd("c:/Rtest")
#download package
install.packages('KoNLP')
install.packages('rvest')
install.packages('XML')
install.packages('stringr')
library(KoNLP)
library(rvest)
library(XML) 
library(stringr)

all_reviews <- NULL
url_base <- "https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=45298&type=after&onlyActualPointYn=N&order=newest&page="
#1:100: repeat crawling from a to 100 .
## of review = 10ㅌ 100 pages = 1,000 
for (i in 1:100) { 
  newr <- NULL
  url <- paste(url_base, i, sep='')
  txt <- readLines(url, encoding="UTF-8", warn=FALSE)
  
  reviews <- txt[which(str_detect(txt, "id=\"_filtered_ment"))+4] 
  #if class=score_reple is found, get text after line 4 for save crawling
  reviews <- gsub("<.+?>|\t","", reviews) #remove special characters
  
  newr <- cbind(reviews)
  all_reviews <- rbind(all_reviews, newr)
}
# save review
write.table(all_reviews, "movie_review1.txt")


