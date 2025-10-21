---
title: "Advent of Code 2018"
subtitle: "Day 1"
format: html
---

## Sum

We get a series of input. +1 indicate that we add 1 to the start value.
-2 that we subtract 2 from the new start value. 

So... Basically we just add everything. Probably after removing som "+" signs.

### Part 1


library(tidyverse)
read_lines("aoc2018/data/day-01-input.txt") |> 
  as.numeric() |> 
  sum()

### Part 2

Now we need to keep track of the value after processing each input. So we need a cumulative
sum. We also have to keep track of when we encounter the first repeated value. And we might
need to recycle the input several times before we encounter a repated value.

We do not know how many times we have to recycle. 

The example is:
+1, -2, +3, +1
And we are given that it might need to recycle once.


example <- c(1,-2,3,1)
example <- c(1, -1)
example <- c(3, 3, 4, -2, -4)
example <- c(-6, 3, 8, 5, -6)
example <- c(+7, +7, -2, -7, -4)

not_found <- TRUE
test_value <- c(0,example)
while(not_found){
  not_found <- !any(duplicated(cumsum(test_value)))
  test_value <- c(test_value, example)
}
cumsum(test_value)[duplicated(cumsum(test_value))][1]

Running the examples - c(1,-1) in particular, reveals that 
the first repeated value might be the very first value. Implicitly
we begin with 0!

Alright:


input <- read_lines("aoc2018/data/day-01-input.txt") |> 
  as.numeric()
input

not_found <- TRUE
test_value <- c(0,input)
while(not_found){
  not_found <- !any(duplicated(cumsum(test_value)))
  test_value <- c(test_value, input)
}
cumsum(test_value)[duplicated(cumsum(test_value))][1]

done!