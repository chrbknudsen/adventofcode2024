# aoc 2022 day 4
library(tidyverse)

input <- readLines("aoc2022/data/day-04-input.txt")

# ("2-4,6-8")

# eval(parse(text = "2:4"))


example <- c(
  "2-4,6-8",
"2-3,4-5",
"5-7,7-9",
"2-8,3-7",
"6-6,4-6",
"2-6,4-8"
)

sub("-", ":", example[1])

overlap <- function(input){
  input <- strsplit(base::gsub("-", ":", input), ",")
  eval(parse(text = input[[1]][1]))
  tmp <- list(eval(parse(text = input[[1]][1])), eval(parse(text = input[[1]][2])))
  all(is.element(tmp[[1]], tmp[[2]]) ) | all(is.element(tmp[[2]], tmp[[1]]) )
  
}

sum(map_lgl(input, overlap))
# del 1 done


# part 2 - any overlap

overlap <- function(input){
  input <- strsplit(base::gsub("-", ":", input), ",")
  eval(parse(text = input[[1]][1]))
  tmp <- list(eval(parse(text = input[[1]][1])), eval(parse(text = input[[1]][2])))
  any(is.element(tmp[[1]], tmp[[2]]) ) | any(is.element(tmp[[2]], tmp[[1]]) )
  
}
sum(map_lgl(example, overlap))
sum(map_lgl(input, overlap))

part 2 også løst