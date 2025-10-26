---
title: "Advent of Code 2019"
subtitle: "Day 1"
format: html
---

## Divide, round, subtract sum

### Part 1

We are given some values, and have to transform them, by dividing them by 3,
rounding _down_ and subtract 2. 
We then have to add all these values to get the answer.


#### The example

We get some example input:

example <- c(12, 14, 1969, 100756)

We build a function that do the transformation:



fuel_req <- function(input){
  input <- input/3
  input <- floor(input)
  input - 2
}

fuel_req(example)

We get the results the task tells us are correct.

#### The actual task

Read the input:

readLines("aoc2019/data/day-01-input.txt") |> 
strsplit(split = ",") |> 
  unlist() |> 
as.numeric() |> 
  fuel_req() |> 
  sum()

### Part 2

Now we need to transform the data recursively

fuel_req_2 <- function(input){
  result <- fuel_req(input)
  while(temp > 0){}
}

library(tidyverse)



