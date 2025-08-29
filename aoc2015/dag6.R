library(tidyverse)

input <- readLines("aoc2015/data/day-06-input") 
input

Tre kommandoer - turn on, turn of og toggle

Og så to koordinater.

Disse koordinater skal jeg have konverteret til 1-indexerede.
Og vi er i en matrix.

Så en funktion, der tager en matrix, en type handling og to sæt koordinater.
Og så tænder, slukker, etc. 

Vi starter med at importere.

orders <- input %>% as_tibble() %>% 
  separate_wider_regex(value, patterns = c("switch" = "[a-z\\s]*", "rest" = ".*")) %>% 
  separate_wider_delim(rest, delim = "through", names = c("to", "from")) %>% 
  mutate(switch = str_remove_all(switch, "turn")) %>% 
  mutate(across(everything(), str_trim)) %>% 
  separate_wider_delim(to, delim = ",", names = c("X0", "Y0")) %>% 
  separate_wider_delim(from, delim = ",", names = c("X1", "Y1")) %>% 
  mutate(across(2:5, as.numeric)) %>% 
  mutate(across(2:5, ~ .x + 1))


Nu har vi ordrene til matricen.

lysene <- matrix(data = F, nrow  = 1000, ncol = 1000)
# og det skal være en logical - for den kan jeg switche efter behov!


# lysene[2:5, 3:4] <- T
# lysene
# 3:4 matcher her Y0,Y1
# og 2:5 X0,X1
# 
# Det er let at tænde og slukke. 


update <- function(X0,Y0,X1,Y1, action){
  if(action == "on"){
    lysene[X0:X1, Y0:Y1] <<- T
  }
  if(action == "off"){
    lysene[X0:X1, Y0:Y1] <<- FALSE
  }
  if(action == "toggle"){
    lysene[X0:X1, Y0:Y1] <<- !lysene[X0:X1, Y0:Y1]
  } 
  
}


 for(i in 1:nrow(orders)){
   update(orders$X0[[i]], orders$Y0[[i]], orders$X1[[i]], orders$Y1[[i]], orders$switch[[i]])
 }

sum(lysene)


# del 2

lysene <- matrix(data = 0, nrow  = 1000, ncol = 1000)
# Nu 0, da vi justerer på lysstyrke i stedet

update <- function(X0,Y0,X1,Y1, action){
  if(action == "on"){
    lysene[X0:X1, Y0:Y1] <<- lysene[X0:X1, Y0:Y1] + 1
  }
  if(action == "off"){
    lysene[X0:X1, Y0:Y1] <<- lysene[X0:X1, Y0:Y1] - 1
    lysene[lysene < 0] <<- 0
  }
  if(action == "toggle"){
    lysene[X0:X1, Y0:Y1] <<- lysene[X0:X1, Y0:Y1] + 2
  } 
  
}


 for(i in 1:nrow(orders)){
   update(orders$X0[[i]], orders$Y0[[i]], orders$X1[[i]], orders$Y1[[i]], orders$switch[[i]])
 }

sum(lysene)