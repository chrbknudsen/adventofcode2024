# 2024 dag 7
# install.packages("permutations")
library(permutations)
library(tidyverse)
input <- readLines("aoc2024/data/day-07-input.txt")
input
Tilgængelige operatorer: "+" og "*"

operators <- c("+", "*")

example <- c("190: 10 19",
"3267: 81 40 27",
"292: 11 6 16 20")


replicate(3, operators, simplify = FALSE) |> 
  expand.grid()


flet <- function(vec_1, vec_2){
  vec_0 <- character(length(vec_1) + length(vec_2))
  vec_0[2*(1:length(vec_2))] <- vec_2
  vec_0[2*(1:(length(vec_1)))-1] <- vec_1
  paste0(vec_0, collapse = "")
}







expand.grid(list(operators, operators))
expand.grid(operators, operators)
tibble(input = example) |> 
  separate_wider_delim(input, delim = ":", names = c("res", "values")) |> 
  mutate(values = str_trim(values)) |> 
  mutate(values_1 = map(values, str_split_1, " ")) |> 
  mutate(længde = map(values_1, length)) |> 
  unnest(længde) |> 
  
