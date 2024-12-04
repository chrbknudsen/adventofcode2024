# dag 7

# Instruktioner af denne type.
# 
# 123 -> x
# 456 -> y
# bitwAnd(x,y) -> d
# bitwOr(x,y) -> e
# bitwShiftL(x,2) -> f
# bitwShiftR(y,2) -> g
# bitwNot(x) -> h
# bitwNot(y) -> i
# 
# Og det er jo vældig fristende. Men giver forkerte resultater, fordi 
# legetøjet til lille bobby tables er 16 bit. Så det er vi nødt til at gøre noget
# ved.
# 
# så vi skal lave vores egne funktioner, der kører 16 bit. Og så kan man jo
# lisså godt lave sine egne operatorer - det vil gøre oversættelsen lettere.

BIT_MASK <- 0xFFFF


`%AND%` <- function(x,y){
  BIT_MASK <- 0xFFFF
  bitwAnd(bitwAnd(x,y), BIT_MASK)
}

`%OR%` <- function(x,y){
  BIT_MASK <- 0xFFFF
  bitwAnd(bitwOr(x,y), BIT_MASK)
}


`%LSHIFT%` <- function(x,n){
  BIT_MASK <- 0xFFFF
  bitwAnd(bitwShiftL(x,n), BIT_MASK)
}

`%RSHIFT%` <- function(x,n){
  BIT_MASK <- 0xFFFF
  bitwAnd(bitwShiftR(x,n), BIT_MASK)
}

# Lidt bøvlet med not operatoren. som skal have en eller anden værdi på venstresiden.

`%NOT%` <- function(dummy, x){
  BIT_MASK <- 0xFFFF
  bitwAnd(bitwNot(x), BIT_MASK)
}

# 123 -> x
# 456 -> y
# x %AND% y -> d
# x %OR% y -> e
# x %LSHIFT% 2 -> f
# y %RSHIFT% 2 -> g
# NULL %NOT% x -> h
# NULL %NOT% y -> i


# Så virker det...

# Så. Nu skal vi have indlæst manualen. 
# Så skal der laves søg og erstat. NOT skal erstattes med 
# NULL %NOT%
#   
# og OR med %OR%

  
# Og øh...   så er der en udfordring. For vi starter med NOT  dq -> dr.
# Og dq er ikke defineret. Det sker først senere...

# Så jeg skal finde en måde at køre tingene i rette rækkefølge.

# Jeg kan jo køre dem en efter en, og se om de kan køre. Hvis, markerer jeg 
# dem som havende kørt. Hvis ikke, går jeg videre til den næste.

  
"ep %OR% eo -> eq"
# eval(str2expression("ep %OR% eo -> eq"))
# eval(str2expression("44430 -> b"))
input <- readLines("aoc2015/data/day-07-input.txt") 
library(tidyverse)

replacement_vector <- c("NOT " = "NULL %NOT% ",
                        "LSHIFT" = "%LSHIFT%",
                        "RSHIFT" = "%RSHIFT%",
                        "AND" = "%AND%",
                        "OR" = "%OR%",
                        "->" = "->>")


run_udtryk <- function(x, udtryk){
  tryCatch(
    {
    result <- eval(str2expression(x))
    max(udtryk$orden)+1
    },
  error = function(e){
    0
  }
  )
}

udtryk <<- input %>% as_tibble() %>% 
  mutate(str = str_replace_all(value, pattern = replacement_vector)) %>% 
  mutate(orden = 0)


for(counter in 1:nrow(udtryk)){
  if(udtryk[counter,3] == 0){
    udtryk[counter,3] <- run_udtryk(udtryk[[counter,2]], udtryk=udtryk)
  }
}

# a2015
og jeg kan også løse nr. to.
# så... Jeg skal "blot" have omdøbt alle variable til at ende på 2015...

Jeg skal også have downloaded en ny udgave af input data
sum(udtryk$orden != 0)
# view(udtryk)
# run_udtryk("c %LSHIFT% 1 ->> t", udtryk = udtryk)
# Og det er jo nok fordi c er det næste der skal defineres. og det er en funktion...
