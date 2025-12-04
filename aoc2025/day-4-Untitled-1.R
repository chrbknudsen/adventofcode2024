example <- c("..@@.@@@@.",
"@@@.@.@.@@",
"@@@@@.@.@@",
"@.@@@@..@.",
"@@.@@@@.@@",
".@@@@@@@.@",
".@.@.@.@@@",
"@.@@@.@@@@",
".@@@@@@@@.",
"@.@.@@@.@.")

library(tidyverse)

ncol <- nchar(example[1])

input <- paste0(example, collapse ="") |> str_split_1("") |> 
  matrix(ncol = ncol, byrow = TRUE)



answer <- matrix(NA, nrow = nrow(input), ncol = ncol(input))
for(i in 1:ncol(input)){
  for(j in 1:nrow(input)){
    i_1 <- max(i-1, 1)
    i_2 <- min(i+1, nrow(input))
    j_1 <- max(j-1, 1)
    j_2 <- min(j+1, ncol(input))
    n_rols <- (input[i_1:i_2, j_1:j_2] == "@") |> sum(na.rm = TRUE) 
    if(n_rols < 5 & input[i,j] == "@"){
      answer[i,j] <-  1
    }
  }
}

den tæller i,j med i testen om det er "@"


sum(answer, na.rm = TRUE)

# Så. i,j. Vi skal have fra i-1 til i+1
# men dog skal i-1 rundes af til 1 hvis resultatet er 0. Og i+1 skal rundes af til max ncol
# Vi skal også have j-1 til j+1. Og de skal også rundes af.



input <- readLines("aoc2025/dag-4input.txt")
ncol <- nchar(input[1])
input <- paste0(input, collapse ="") |> str_split_1("") |> 
  matrix(ncol = ncol, byrow = TRUE)
answer <- matrix(NA, nrow = nrow(input), ncol = ncol(input))
for(i in 1:ncol(input)){
  for(j in 1:nrow(input)){
    i_1 <- max(i-1, 1)
    i_2 <- min(i+1, nrow(input))
    j_1 <- max(j-1, 1)
    j_2 <- min(j+1, ncol(input))
    n_rols <- (input[i_1:i_2, j_1:j_2] == "@") |> sum(na.rm = TRUE) 
    if(n_rols < 5 & input[i,j] == "@"){
      answer[i,j] <-  1
    }
  }
}

sum(answer, na.rm = TRUE)
