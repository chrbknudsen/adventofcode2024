# # 2017, dag 5

# test <- c(0,3,0,1,-3)
# test
# position <- 1
# steps <- 0

# while(position > 0 & position <= length(test)){
#   steps <<- steps + 1
#   print(steps)
#   instruks <<- test[position]
#   test[position] <- test[position] + 1
#   position <<- position + instruks
# }

# test <- readLines("aoc2017/data/day-05-input.txt")
# test <- as.numeric(test)
# position <- 1
# steps <- 0

# while(position > 0 & position <= length(test)){
#   steps <<- steps + 1
#   print(steps)
#   instruks <<- test[position]
#   test[position] <- test[position] + 1
#   position <<- position + instruks
# }
# Bum. Done.

# part 2


test <- readLines("data/day-05-input.txt")
test <- as.numeric(test)
# test <- c(0,3,0,1,-3)

position <- 1
steps <- 0


while(position > 0 & position <= length(test)){
  steps <<- steps + 1
  print(steps)
  instruks <<- test[position]
  ifelse(instruks >= 3, inkre <- -1, inkre <- 1)
  test[position] <- test[position] + inkre
  position <<- position + instruks
}
# 🎄



solve2_fast <- function(x) {
  x <- as.integer(x)
  i <- 1L; steps <- 0L; n <- length(x)
  repeat {
    if (i < 1L || i > n) return(steps)
    old <- x[i]
    x[i] <- if (old >= 3L) old - 1L else old + 1L
    i <- i + old
    steps <- steps + 1L
  }
}
# evt. compiler::cmpfun for lidt ekstra
solve2_fast <- compiler::cmpfun(solve2_fast)

x <- as.integer(readLines("aoc2017/data/day-05-input.txt"))

answer2 <- solve2_fast(x)
answer2
Solvefast er jo snyd - for det er chatty der har skrevet den. Men det relevante
er nok compiler delen!

Og øh, den kommer vi nok til at bruge en del gange igen...