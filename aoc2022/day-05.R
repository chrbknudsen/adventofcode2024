# aoc 2022 dag 5

input <- readLines("aoc2022/data/day-05-input.txt")
input[1:9]
input[10:length(input)]
install.packages("collections")
library(collections)
test <- 1:3
test <- deque(test)
test$pop()
test$as_list()

# neat

input[1:9]


example <- c("    [D]    ",
"[N] [C]    ",
"[Z] [M] [P]",
" 1   2   3 ") 

stack_nos <- example[length(example)]
stack_nos

pos <- gregexpr("[0-9]", stack_nos)[[1]]
pos <- pos |> as.numeric()
pos

# example |> rowwise() |> str_split_1("") %>%   { .[pos] }
example[1:(length(example)-1)] |> 
map(str_split_1, "") |> 
  lapply("[", c(pos)) |> as.data.frame() |> 
  rename(c_1 = 1,
         c_2 = 2,
         c_3 = 3) 
