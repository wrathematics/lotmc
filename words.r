library(ngram)
seed = 1234

x = readLines("EOSP2E.txt")
x = paste0(x, collapse=" ")
px = preprocess(x)
px = splitter(x, TRUE)

fixer <- function(str)
{
  x <- gsub(str, pattern=" ", replacement="")
  x <- gsub(x, pattern="_", replacement=" ")
  x
}

charbabble <- function(ng) fixer(babble(ng, seed=seed))

ng <- ngram(px, 2)
charbabble(ng)

ng <- ngram(px, 3)
charbabble(ng)

ng <- ngram(px, 9)
charbabble(ng)


