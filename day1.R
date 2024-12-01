# Opgave 1.1
library(tidyverse)
exempel <- tribble(~list1, ~list2,
3,   4,
4,   3,
2,   5,
1,   3,
3,   9,
3,   3)

sum(abs(sort(exempel$list1) - sort(exempel$list2)))

# get input
data <- read_delim("data/input", col_names = F) %>% 
  select(list1 = X1, list2 = X4)

sum(abs(sort(data$list1) - sort(data$list2)))


# Opgave 1.2


Så nu skal vi tælle hvor mange gange hvert tal optræder i kolonne 2. 

exempel %>% 
  select(list2) %>% 
  count(list2) %>% 
  right_join(exempel, by = c("list2" = "list1")) %>% 
  transmute(sim_score = n*list2) %>% 
  summarise(answer = sum(sim_score, na.rm = TRUE))

Og på det rigtige datasæt


data %>% 
  select(list2) %>% 
  count(list2) %>% 
  right_join(data, by = c("list2" = "list1")) %>% 
  transmute(sim_score = n*list2) %>% 
  summarise(answer = sum(sim_score, na.rm = TRUE))

