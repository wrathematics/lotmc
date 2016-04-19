library(ngram)

corpus <- readRDS("corpus.rds")

ng <- ngram(corpus, n=3)
