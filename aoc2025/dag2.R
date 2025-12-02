library(tidyverse)

x <- c("aa", "abab", "abcabc", "abcbc", "abcdabd", "abc")

m <- regexpr("(.+)(?=.*\\1)", x, perl = TRUE)

grepl("(.+)(?=.*\\1)", x, perl = TRUE)




invalid_id <- function(x){
  x <- as.character(x)
  substring(x, 1, nchar(x)/2) == substring(x, nchar(x)/2 + 1, nchar(x))
}
invalid_id <- function(x){
 grepl("^(.+?)\\1+$", x)

}
invalid_id <- compiler::cmpfun(invalid_id)

4174379265
33981052371 

example <- "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124"
strsplit(example, ",", ) 
tibble(input = strsplit(example, ",") |> unlist()) |> 
  separate_wider_delim(input, delim = "-", names=c("id1", "id2")) |> 
  mutate(across(id1:id2, as.numeric)) |> 
  mutate(ranges = map2(id1, id2, ~seq(.x, .y, by = 1))) |> 
  unnest(ranges) |> 
  mutate(invalid = map(ranges, invalid_id)) |> 
  unnest(invalid) |> 
  filter(invalid) |> 
  summarise(answer = sum(ranges))
  
library(tidyverse)
input <- readLines("aoc2025/dag2input.txt")

tibble(input = strsplit(input, ",") |> unlist()) |> 
  separate_wider_delim(input, delim = "-", names=c("id1", "id2")) |> 
  mutate(across(id1:id2, as.numeric)) |> 
  mutate(ranges = map2(id1, id2, ~seq(.x, .y, by = 1))) |> 
  unnest(ranges) |> 
  mutate(invalid = map(ranges, invalid_id)) |> 
  unnest(invalid) |> 
  filter(invalid) |> 
  summarise(answer = sum(ranges))





  mutate(id1_invalid = map(id1, invalid_id)) |> 
  unnest(id1_invalid) |> 
  mutate(id2_invalid = map(id2, invalid_id)) |> 
  unnest(id2_invalid) 
  mutate(across(id1:id2, as.numeric)) |> 
  mutate(id1 = id1*id1_invalid,
  id2 = id2*id2_invalid) |> 
  summarise(answer = sum(id1) + sum(id2))
