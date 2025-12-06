library(tidyverse)
example <- c(
"3-5",
"10-14",
"16-20",
"12-18",
"",
"1",
"5",
"8",
"11",
"17",
"32"
)

input <- example
input <- readLines("aoc2025/dag5input.txt")

blank_pos <- which(input=="")

ranges <- input[1:blank_pos-1]
ingredients <- input[(blank_pos+1):length(input)]

ingredients <- ingredients |> 
  tibble() |> 
  mutate(ingredients = as.numeric(ingredients))

ranges <- tibble(ranges= ranges)

ingredients

ranges |> 
  separate_wider_delim(ranges, delim = "-", names = c("start", "stop")) |> 
  mutate(across(everything(), as.numeric)) |> 
  transmute(fresh = map2(start, stop, seq, 1)) |> 
  unnest_longer(fresh) |> 
  distinct(fresh) |> 
  semi_join(ingredients, by=c("fresh" = "ingredients")) |> 
  nrow()


between
