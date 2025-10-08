# Så. Vi starter et sted. og så følger vi instruksen.


# 123
# 456
# 789


# Hvis vi er på 5 og får U ny pos 2


# en matrix med start og instruktion. Og den ny 

#   U D L R
# 1 1, 4, 1, 2
# 2 2, 5, 1, 3
# 3 3, 6, 2, 3
# 4 1, 7, 4, 5
# 5 2, 8, 4, 6
# 6 3, 9, 5, 6
# 7 4, 7, 7, 8
# 8 5, 8, 7, 9
# 9 6, 9, 8, 9

library(tidyverse)

lut <- c( 1, 4, 1, 2,
 2, 5, 1, 3,
 3, 6, 2, 3,
 1, 7, 4, 5,
 2, 8, 4, 6,
 3, 9, 5, 6,
 4, 7, 7, 8,
 5, 8, 7, 9,
 6, 9, 8, 9) |> 
  matrix(nrow = 9, byrow = T,
    dimnames = list(pos = c(1:9), instruks = c("U", "D", "L", "R")))



ny_pos <- function(pos, instruks){
  lut[pos, instruks]
}


input <- readLines("aoc2016/data/02-input.txt")

# input <- c("ULL", "RRDDD", "LURDL", "UUUUD")

input <-   str_split(input, "")

svar <<- numeric()
pos <- 5
for(i in 1:length(input)){
  for(j in input[[i]]){
    pos <- ny_pos(pos, j)
  }
svar[i] <- pos
}

as.numeric(paste0(svar, collapse = ""))

# Del 2
# samme metodik. Blot anden lut.

# 	U	D	L	R
# 1	1	3	1	1
# 2	2	6	2	3
# 3	1	7	2	4
# 4	4	8	3	4
# 5	5	5	5	6
# 6	2	A	5	7
# 7	3	C	6	8
# 8	4	C	7	9
# 9	9	9	8	9
# A	6	A	A	B
# B	7	D	A	C
# C	8	C	B	C
# D	B	D	D	D

lut <- c("1",	"3",	"1",	"1",
"2",	"6",	"2",	"3",
"1",	"7",	"2",	"4",
"4",	"8",	"3",	"4",
"5",	"5",	"5",	"6",
"2",	"A",	"5",	"7",
"3",	"B",	"6",	"8",
"4",	"C",	"7",	"9",
"9",	"9",	"8",	"9",
"6",	"A",	"A",	"B",
"7",	"D",	"A",	"C",
"8",	"C",	"B",	"C",
"B",	"D",	"D",	"D") |> 
    matrix(nrow = 13, byrow = T,
    dimnames = list(pos = c(as.character(1:9), LETTERS[1:4]), instruks = c("U", "D", "L", "R")))

lut


input <- readLines("aoc2016/data/02-input.txt")

# input <- c("ULL", "RRDDD", "LURDL", "UUUUD")
input <-   str_split(input, "")
svar <<- numeric()

pos <- "5"
for(i in 1:length(input)){
  for(j in input[[i]]){
    pos <- ny_pos(pos, j)
  }
svar[i] <- pos
}

paste0(svar, collapse = "")

