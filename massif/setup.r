library(ngram)
library(rvest)

# http://ae-lib.org.ua/texts-c/tolkien__the_lord_of_the_rings_1__en.htm

durrett <- paste0(readLines("../EOSP2E.txt"), collapse=" ")
durrett <- preprocess(durrett, "lower", FALSE, TRUE, TRUE)

fellowship <- html_text(html("../fellowship.html"))
fellowship <- preprocess(fellowship, "lower", FALSE, TRUE, TRUE)

corpus <- paste0(durrett, fellowship, collapse=" ")
corpus <- gsub(corpus, pattern="\n", replacement=" ")

saveRDS(corpus, file="corpus.rds")

