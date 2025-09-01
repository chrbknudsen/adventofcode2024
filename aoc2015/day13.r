install.packages("RccpAlgos")
library(tidyverse)
library(RccpAlgos)
library(arrangements)
guests <- c("alice", "bob", "carol", "david", "eric", "frank", "george", "mallory")


permutations(guests) |> 
  as_tibble() |> 
  mutate(V9 = V1)


input <- readLines("aoc2015/data/day-13-input.txt")
input <- input |> as_tibble() |> 
  mutate(f_person = str_extract(value, "\\w+"),
         l_person = str_extract(value, "\\w+(?=\\.$)"),
         retning = str_extract(value, "gain|lose"), 
         hu = str_extract(value, "\\d+")
) |> 
  select(-value) |> 
  mutate(retning2 = if_else(retning == "gain", 1, -1)) |> 
  mutate(hu2 = retning2*as.numeric(hu)) |> 
  select(f_person, l_person, hu = hu2)


input |> 
  pivot_wider(names_from = l_person, values_from = hu, values_fill = 0) 
 