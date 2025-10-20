# dag 5 2024

library(tidyverse)

rules <- readLines("data/dag-05-example") %>% as_tibble() %>% 
  filter(str_detect(value, "\\|")) %>% 
  pull(value)

example <- readLines("data/dag-05-example") %>% as_tibble() %>% 
  filter(str_detect(value, ","))
example %>% view()

test <- "75,47,61,53,29"
rule <- "47|53"


indices <- which(test %in% c(47,53))
indices[1] < indices[2]

indices <- which(str_split_1(test,",") %in% str_split_1(rule, "\\|"))

for(i in rules){
  indices <- which(str_split_1(test,",") %in% str_split_1(i, "\\|"))
  print(indices[1] < indices[2])
  
}
rules


check_rules <- function(x){
  res <- TRUE
  for(i in rules){

    rule <- str_split_1(i, "\\|")
    rule_1 <- rule[1]
    rule_2 <- rule[2]
    index_1 <- which(str_split_1(x,",") == rule_1)
    index_2 <- which(str_split_1(x,",") == rule_2)
    if(!any(is_empty(index_1), is_empty(index_2))){  
      if(!(index_1 < index_2)){res <- F}
    }

       }
  return(res)
}

midt_værdi <- function(x){
  x <- str_split_1(x, ",")  
  x[median(1:length(x))]
}

median(1:9)


rules <- readLines("data/day-05-input.txt") %>% as_tibble() %>% 
  filter(str_detect(value, "\\|")) %>% 
  pull(value)

example <- readLines("data/day-05-input.txt") %>% as_tibble() %>% 
  filter(str_detect(value, ","))

example %>% 
  mutate(legal = map(value, check_rules)) %>% 
  unnest(legal) %>% 
  filter(legal) %>% 
  mutate(midten = map(value, midt_værdi)) %>% 
  unnest(midten) %>% 
  mutate(midten = as.numeric(midten)) %>% 
  summarise(svar = sum(midten))


example %>% 
  mutate(legal = map(value, check_rules)) %>% 
  unnest(legal) %>% 
  filter(!legal)




## Nå. Hvordan bytter jeg om på to elementer i en R-vektor?

# Eksempel vektor
x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)

# Bytte om på element 3 og 7
x[c(3, 7)] <- x[c(7, 3)]

test <- "75,97,47,61,53"
x <- test

update <- str_split_1(x,",")
for(i in rules){
  rule <- str_split_1(i, "\\|")
  if(sum(rule %in% update) == 2){
    index_1 <- which(update == rule[1])
    index_2 <- which(update == rule[2])
    if((index_1 > index_2)){
      update[c(index_1, index_2)] <- update[c(index_2, index_1)]
      }
    }
  }

