
1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the second digit and the third digit (2) matches the fourth digit.
1111 produces 4 because each digit (all 1) matches the next.
1234 produces 0 because no digit matches the next.
91212129 produces 9 because the only digit that matches the next one is the last digit, 9.




example <- c("1122" ,
"1111" ,
"1234" ,
"91212129")

input <- readLines("aoc2017/data/day-01-input.txt")

library(tidyverse)

captcha <- function(input){
  input <- str_split_1(input, "") |> as.numeric()
  input_shifted <- c(input[length(input)], input[2:length(input)-1])
  sum(input[input == input_shifted])
}


captcha(example[4])

input <- readLines("aoc2017/data/day-01-input.txt")
captcha(input)
# korrekt svar 1!

# del 2

# En ny funktion: 
  next_captcha <- function(input){
  input <- str_split_1(input, "") |> as.numeric()
  len <- length(input)
  input_shifted <- c(input[(len/2+1):len], input[1:(len/2)])
  sum(input[input == input_shifted])
  }



next_captcha(input)
den er også korrekt!