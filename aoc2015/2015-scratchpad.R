# ( betyder at gå op. ) at gå ned.
# Så jeg har en tekst-streng? 
# den splitter jeg - og bruger den til at indeksere for at få 
# 1 og -1. 
# og så lægger jeg alle tallene sammen. 
library(t)
test <- "))((((("

scheme <- c("(" = 1, ")" = -1)

sum(scheme[str_split_1(test,"")])


# det skal vi have en funktion til .
floor <- function(x){
  sum(scheme[str_split_1(x,"")])
}
floor(test)


# det er faktisk overkill at lave en funktion. det lader vi 
# være med.
input <- readLines("aoc2015/data/day-01-input.txt")
floor(input)


# task2
# det er så det kumulative vi skal have. Og find den position hvor
# den kumulative sum er -1.

min(which(cumsum(scheme[str_split_1(input, "")]) == -1))
