# dag 5 2015
library(tidyverse)
test <- c("ugknbfddgicrmopn",
"aaa",
"jchzalrnumimnmhp",
"haegwjzuvuyypxyu",
"dvszwmarrgswjxmb",
"abcdde")


test %>% as_tibble() %>% 
  mutate(krav3 = !str_detect(value, "ab|cd|pw|xy")) %>% 
  mutate(krav1 = str_count(value, "[aeiou]")) %>% 
  mutate(krav2 = str_detect(value, "([a-z])\\1")) %>% 
  mutate(krav1  = krav1 > 2) %>% 
  mutate(nice = krav1 & krav2 & krav3) %>% 
  filter(nice)


