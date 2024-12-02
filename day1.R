# opgave 2
library(tidyverse)



check <- function(x){
  x <- c(x[-1], NA) - x
  x <- x[!is.na(x)]
  res1 <- all(sign(x) == 1) | all(sign(x) == -1) # all increasing or decreasing
  res2 <- all(abs(x) < 4 & abs(x) > 0)
  res1 & res2
}


readLines("data/day-02-example.txt") %>% as_tibble() %>% 
  mutate(vectors = str_split(value, " ")) %>% 
  mutate(vectors = map( vectors, as.numeric)) %>% 
  transmute(check = map(vectors, check)) %>% 
  unnest(check) %>% 
  summarise(answer = sum(check))

  

readLines("data/day-02-input.txt") %>% as_tibble() %>% 
  mutate(vectors = str_split(value, " ")) %>% 
  mutate(vectors = map( vectors, as.numeric)) %>% 
  transmute(check = map(vectors, check)) %>% 
  unnest(check) %>% 
  summarise(answer = sum(check))
         


# part2


dampener <- function(x){
  res <- FALSE
  for(i in 1:length(x)){
    if(check(x[-i])) res <- TRUE
  }  
  res
}

readLines("data/day-02-example.txt") %>% as_tibble() %>% 
  mutate(vectors = str_split(value, " ")) %>% 
  mutate(vectors = map( vectors, as.numeric)) %>% 
  transmute(check = map(vectors, dampener)) %>% 
  unnest(check) %>% 
  summarise(answer = sum(check))

readLines("data/day-02-input.txt") %>% as_tibble() %>% 
  mutate(vectors = str_split(value, " ")) %>% 
  mutate(vectors = map( vectors, as.numeric)) %>% 
  transmute(check = map(vectors, dampener)) %>% 
  unnest(check) %>% 
  summarise(answer = sum(check))
