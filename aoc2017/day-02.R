# aoc 2017   day 

library(tidyverse)
input <- read_tsv("aoc2017/data/day-02-input.txt", col_names = FALSE)

min_max <- function(vec){
  max(vec) - min(vec)
}


input <- readLines("aoc2017/data/day-02-input.txt")
input <- input |> str_split(pattern = "\\t")
input<- lapply(input, as.numeric)
input <- lapply(input, min_max)
input |> unlist() |> sum()
# korrekt svar 

# part 2


Nå. Men så skal vi bruge en funktion der finder de eneste to
tal i hver række, der er dividerbare. 

test <- c(9, 4, 7, 3)
5 9 2 8
9 4 7 3
3 8 6 5

is_almost_integer <- function(x, tol = 1e-8) {
  abs(x - round(x)) < tol
}

tester <- function(input){
  g_c_d <- numeric()
  for(i in 1:length(input)){
    g_c_d <- c(g_c_d, input[-i]/input[i])

  }
  g_c_d[is_almost_integer(g_c_d)]

}

tester(test)
  
  
input <- readLines("aoc2017/data/day-02-input.txt")
input <- input |> str_split(pattern = "\\t")
input<- lapply(input, as.numeric)
input <- lapply(input, tester)

input

input |> unlist() |> sum()

og så virker det!