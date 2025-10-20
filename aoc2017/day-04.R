library(tidyverse)
input <- read_lines("aoc2017/data/day-04-input.txt")

# for hver linie - er der duplikerede ord?

tibble(input = input) |> 
  rowwise() |> 
  mutate(vect =  map(input, str_split_1, " ")) |>
  ungroup() |> 
  mutate(words = map(vect, length)) |> 
  unnest(words) |> 
  mutate(vect = map(vect, unique)) |> 
  mutate(rest_words = map(vect, length)) |> 
  unnest(rest_words) |> 
  filter(words == rest_words) |> 
  nrow()

og svaret var korrekt!

Nu skal vi så sikre at de ikke er anagrammer.

Så.

letter_sort <- function(input){
  lapply(str_split_1(input, ""), paste0,  collapse = "")
}

letter_sort <- function(input){
  lapply(lapply(lapply(input, str_split_1, ""), sort), paste0, collapse = "")
}

letter_sort(test)

tibble(input = input) |> 
  rowwise() |> 
  mutate(vect = map(input, str_split_1, " ")) |> 
  ungroup() |> 
  mutate(words = lapply(vect, letter_sort)) |> 
  mutate(words = lapply(words, unique)) |> 
  mutate(before = map(vect, length)) |> 
  mutate(after = map(words, length)) |> 
  unnest(before) |> 
  unnest(after) |> 
  filter(before == after) |> 
  nrow()
  
Den er også done.