library(tidyverse)
library(pracma)
library(gmp)
library(numbers)

current_password <- "cqjxjnds"


pw_to_int <- function(c_p){
  c_p <- str_split_1(c_p, "")
  v <- match(c_p, letters)
val <- 0
for(d in v) val <- val * 26 + d
val}

pw_to_int(current_password)

int_to_pw <- function(x) {
    out <- character()
    while (x > 0) {
      x <- x - 1
      r <- x %% 26
      out <- c(letters[r + 1L], out)
      x <- x %/% 26
    }
    paste0(out, collapse = "")
  }


# test nr 1
tbs <- character()
for(i in 1:24){
  tbs <- c(tbs, paste0(letters[i:(i+2)], collapse = ""))
}

tbs
test_1 <- function(password){
  any(str_detect(password, tbs ))
}




# test nr 2
test_2 <- function(password){
  !str_detect(password, "i|o|l")
  }

# test nr 3
dob_bog <- character()

for(i in letters){
  dob_bog <- c(dob_bog, paste0(i,i, collapse = ""))
}

test_3 <- function(password){
  sum(str_detect(password, dob_bog)) > 1
}

current_password <- "cqjxxyzz"
fundet <- FALSE

while(!fundet){
  current_password <- int_to_pw(pw_to_int(current_password) + 1)
  fundet <- all(test_1(current_password), test_2(current_password), test_3(current_password))
  print(current_password)
}

