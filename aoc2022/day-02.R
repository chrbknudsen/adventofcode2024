# aoc 2022 day 2

input <- readLines("aoc2022/data/day-02-input.txt")

example <- c("A Y", "B X", "C Z")

lut <- c(4, 8, 3, 
         1, 5, 9, 
         7, 2, 6)
lut <- matrix(lut, nrow = 3, byrow = TRUE)

rownames(lut) <- c("ROCK", "PAPER", "SCISSORS")
colnames(lut) <- c("rock", "paper", "scissors")

lut
rownames(lut) <- c("A", "B", "C")
colnames(lut) <- c("X", "Y", "Z")


score <- function(strat){
  strat <- str_split_1(strat, pattern = " ")
  opp <- strat[1]
  me <- strat[2]
  lut[opp,me]
}

tibble(strat = example) |> 
  mutate(score = map_dbl(strat, score)) |> 
  summarise(svar = sum(score))


tibble(strat = input) |> 
  mutate(score = map_dbl(strat, score)) |> 
  summarise(svar = sum(score))
