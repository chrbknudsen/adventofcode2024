# aoc 2022 day 6
library(tidyverse)
input <- readLines("aoc2022/data/day-06-input.txt") |> 
  str_split_1("")
example  <- c("bvwbjplbgvbhsrlpgdmjqwftvncz",
"nppdvjthqldpwncqszvftbrmjlhg",
"nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg",
"zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw")


ens <- function(vec){
  length(unique(vec)) == 4
}
ens_2 <- function(vec){
  length(unique(vec)) == 14
}

svar <- function(input){
  not_found <- TRUE
  i <- 1
  while(not_found){
    not_found <- !ens(input[i:(i+3)])
    i <- i +1
  }
  i+2
}

test <- example[4] |> str_split_1("")
svar(input)

svar_2 <- function(input){
  not_found <- TRUE
  i <- 1
  while(not_found){
    not_found <- !ens_2(input[i:(i+13)])
    i <- i +1
  }
  i+12
}

example <- c(
  "mjqjpqmgbljsphdztnvjfqwrcgsmlb",
"bvwbjplbgvbhsrlpgdmjqwftvncz",
"nppdvjthqldpwncqszvftbrmjlhg",
"nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg",
"zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"
)

test <- example[5] |> str_split_1("")
svar_2(test)
svar_2(input)
