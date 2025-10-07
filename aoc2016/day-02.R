Så. Vi starter et sted. og så følger vi instruksen.


123
456
789


Hvis vi er på 5 og får U ny pos 2


en matrix med start og instruktion. Og den ny 

  U D L R
1 1, 4, 1, 2
2 2, 5, 1, 3
3 3, 6, 2, 3
4 1, 7, 4, 5
5 2, 8, 4, 6
6 3, 9, 5, 6
7 4, 7, 7, 8
8 5, 8, 7, 9
9 6, 9, 8, 9

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

lut[5,"R"]
