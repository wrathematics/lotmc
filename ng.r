library(ngram)
library(rvest)

# http://ae-lib.org.ua/texts-c/tolkien__the_lord_of_the_rings_1__en.htm

durrett <- paste0(readLines("EOSP2E.txt"), collapse=" ")
durrett <- preprocess(durrett, "lower", FALSE, TRUE, TRUE)

fellowship <- html_text(html("./fellowship.html"))
fellowship <- preprocess(fellowship, "lower", FALSE, TRUE, TRUE)

corpus <- paste0(durrett, fellowship, collapse=" ")
corpus <- gsub(corpus, pattern="\n", replacement=" ")

ng <- ngram(corpus)
sz <- as.numeric(ng@ngsize)
howbig(sz, sz)
babble(ng, 150)



memuse(corpus)

ng <- ngram(corpus, n=3)
sz <- as.numeric(ng@ngsize) #FIXME this is an int overflow bug...
howbig(sz, sz)
babble(ng, 150)



#### benchmarks
system.time({
  ngram(corpus, 2)
})
# user  system elapsed
# 0.320   0.016   0.337

library(tau)
system.time({
  textcnt(corpus, n=2L, split=" ", method="string")
})
# user  system elapsed
# 300.584   0.016 300.302
