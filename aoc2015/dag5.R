# dag 5 2015

# regulære udtryk!

library(tidyverse)
test <- c("ugknbfddgicrmopn",
"aaa",
"jchzalrnumimnmhp",
"haegwjzuvuyypxyu",
"dvszwmarrgswjxmb")


test %>% as_tibble() %>% 
  mutate(krav3 = !str_detect(value, "ab|cd|pq|xy")) %>% 
  mutate(krav1 = str_count(value, "[aeiou]")) %>% 
  mutate(krav2 = str_detect(value, "([a-z])\\1")) %>% 
  mutate(krav1  = krav1 > 2) %>% 
  mutate(nice = krav1 & krav2 & krav3) %>% 
  filter(nice) %>% 
  nrow()

# Hm. jeg rammer for lavt.

input <- readLines("aoc2015/data/day-05-input") 

input %>% as_tibble() %>% 
  mutate(krav3 = !str_detect(value, "ab|cd|pq|xy")) %>% 
  mutate(krav1 = str_count(value, "[aeiou]")>2) %>% 
  mutate(krav2 = str_detect(value, "([a-z])\\1")) %>% 
  mutate(nice = krav1 & krav2 & krav3) %>% 
  filter(nice) %>% 
  nrow()



# Så var den der!
  
test <- c("qjhvhtzxzqqjkmpb",
          "aaa",
          "xxyxx ",
          "uurcxstgmygtbstg",
          "ieodomkazucvgmuy")


test %>% as_tibble() %>%
  filter(str_detect(value, "(..).*\\1")) %>% 
  filter(str_detect(value, "(.).\\1"))


input %>% as_tibble() %>%
  filter(str_detect(value, "(..).*\\1")) %>% 
  filter(str_detect(value, "(.).\\1"))
