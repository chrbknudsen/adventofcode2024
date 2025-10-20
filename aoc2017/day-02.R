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
