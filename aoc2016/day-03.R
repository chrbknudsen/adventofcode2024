

input <- c(5, 10, 25)
input <- c(1,1,1
)
t1 <- c(1,1,-1)
t2 <- c(1,-1,1)
t3 <- c(-1,1,1)

sum(input*t3)

# Summen af to sider skal være større end den tredie. For alle kombinationer
# Alle skal være positive.

ok_trekant <- function(input){
  t1 <- c(1,1,-1)
  t2 <- c(1,-1,1)
  t3 <- c(-1,1,1)
  all(sum(input*t1) > 0, sum(input*t2)>0, sum(input*t3)>0)
}

ok_trekant(input)

library(tidyverse)
input <- readLines("aoc2016/data/03-input.txt") |> 
  str_squish() |> 
  str_split(" ") |> 
  lapply(as.numeric)


lapply(input, ok_trekant) |> unlist() |> sum()


# part2

