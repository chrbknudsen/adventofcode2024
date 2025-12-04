library(tidyverse)
library(numbers)
library(gmp)
position <-as.bigz(50) %% as.bigz(100)

example <- c("L68",
"L30",
"R48",
"L5",
"R60",
"L55",
"L1",
"L99",
"R14",
"L82")

sequence <- tibble(input = example) |> 
  separate(input, into = c("dir", "value"), sep = "(?<=[A-Za-z])(?=[0-9])") |> 
  mutate(value = as.numeric(value)) |> 
  mutate(value = case_when(
    dir == "R" ~ value,
    dir == "L" ~ - value
  )) |> 
  mutate(cumsum = cumsum(value)) |> 
  mutate(cumsum = cumsum +50)


sum(as.bigz(sequence$cumsum, mod = 100) == 0 )


sequence <- tibble(input = readLines("aoc2025/input-01.txt")) |> 
  separate(input, into = c("dir", "value"), sep = "(?<=[A-Za-z])(?=[0-9])") |> 
  mutate(value = as.numeric(value)) |> 
  mutate(value = case_when(
    dir == "R" ~ value,
    dir == "L" ~ - value
  )) |> 
  mutate(cumsum = cumsum(value)) |> 
  mutate(cumsum = cumsum +50)

sum(as.bigz(sequence$cumsum, mod = 100) == 0 )



sequence <-  tibble(input = example) |> 
  separate(input, into = c("dir", "value"), sep = "(?<=[A-Za-z])(?=[0-9])") |> 
  mutate(value = as.numeric(value)) |> 
  mutate(value = case_when(
    dir == "R" ~ value,
    dir == "L" ~ -value
  )) |> 
   mutate(test = map(value, ~sign(.x)*rep(1, times = abs(.x)))) |> 
   unnest(test) |> 
  mutate(cumsum = cumsum(test)) |> 
  mutate(cumsum = cumsum +50)

sum(as.bigz(sequence$cumsum, mod = 100) == 0 )


sequence <-  tibble(input = readLines("aoc2025/input-01.txt")) |> 
  separate(input, into = c("dir", "value"), sep = "(?<=[A-Za-z])(?=[0-9])") |> 
  mutate(value = as.numeric(value)) |> 
  mutate(value = case_when(
    dir == "R" ~ value,
    dir == "L" ~ -value
  )) |> 
   mutate(test = map(value, ~sign(.x)*rep(1, times = abs(.x)))) |> 
   unnest(test) |> 
  mutate(cumsum = cumsum(test)) |> 
  mutate(cumsum = cumsum +50)

sum(as.bigz(sequence$cumsum, mod = 100) == 0 )

