# need to parse R/L and a digit
# start ved 0,0 
# vi skal holde øje med aktuel retning. pt N. Den kan også være S, E, W
# Hvis aktuel retning N
# Hvis R øg y med digit


nord er 0,1
Hvis vi opdaterer den med R, bliver den 1,0. 
Med L -1,0

position: 0,0
retning: N
Instruks R2
Ny retning, E
Ny position, 0,2
instruks L3
ny retning, N
ny position, 3,2
instruks R2
ny retning E
ny position 5,2

library(tidyverse)

lut <- matrix(
  c("W","E",   # N: L,R
    "E","W",   # S: L,R
    "S","N",   # W: L,R
    "N","S"),  # E: L,R
  nrow = 4, byrow = TRUE,
  dimnames = list(dir = c("N","S","W","E"), turn = c("L","R"))
)
lut



ny_pos <- function(input){
  input_dir <- str_extract(input, pattern = "\\w")
  input_len <- str_extract(input, pattern = "\\d+")
  aktuel_retning <<- lut[aktuel_retning, input_dir]
  vektor <- case_when(
    aktuel_retning == "N" ~ c(0,1),
    aktuel_retning == "S" ~ c(0,-1),
    aktuel_retning == "E" ~ c(1,0),
    aktuel_retning == "W" ~ c(-1,0)
  )
  aktuel_pos <<- vektor*as.numeric(input_len) + aktuel_pos
  aktuel_pos
}


input <- read_lines("aoc2016/data/01-input.txt") |> str_split_1(",") |> str_trim()
aktuel_retning <- "N"
aktuel_pos <- c(0,0)

ny_pos("R5")
ny_pos("L5")
ny_pos("R5")
ny_pos("R3")

for(instruks in input){
  ny_pos(instruks)
}

svar <- sum(abs(aktuel_pos))

# del to

# Nu skal vi så finde den første position vi besøger to gange.
# Så i stedet for bare at opdatere den aktuelle position, skal vi gemme 
# alle positioner fortløbende.

Så vi skal have opdateret vores funktion.
den aktuelle retning behøver vi ikke justere på. men den aktuelle position skal ikke
opdateres, den skal baseres på hvad den var før. Eller? Vi skal sådan set bare gemme aktuel
position i en struktur, samtidig med at vi opdaterer aktuel position.

ny_pos <- function(input){
  input_dir <- str_extract(input, pattern = "\\w")
  input_len <- str_extract(input, pattern = "\\d+")
  aktuel_retning <<- lut[aktuel_retning, input_dir]
  vektor <- case_when(
    aktuel_retning == "N" ~ c(0,1),
    aktuel_retning == "S" ~ c(0,-1),
    aktuel_retning == "E" ~ c(1,0),
    aktuel_retning == "W" ~ c(-1,0)
  )
  aktuel_pos <<- vektor*as.numeric(input_len) + aktuel_pos
  rute[[length(rute)+1]] <<- aktuel_pos
}
rute <- list()
rute[[1]] <- c(0,0)
input <- read_lines("aoc2016/data/01-input.txt") |> str_split_1(",") |> str_trim()
aktuel_retning <- "N"
aktuel_pos <- c(0,0)

# AHA - det jeg finder er slut positioner. Men jo ikke alle mellempositionerne!
#   Jeg bevæger mig gennem et hav af positioner.
# Hvordan finder jeg dem?

input <- c( "R8", "R4", "R4", "R8")
for(instruks in input){
  ny_pos(instruks)
}
rute
jeg har en aktuel position. Og en ny position. Og skal have markeret alle derimellem.

find_mellem <- function(a, b){
  

}

c(8,-4)
c(4,-4)
skal give:
7,-4
6,-4
5,-4



