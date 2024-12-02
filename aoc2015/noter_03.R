# nr 2015-03

# så hvordan håndterer jeg en uendelig stor matrix i R?
#   
#   
# Vi gør det i en dataframe. Vi har den sidste position, (x,y). Ud fra den
# kan vi tilføje en række, baseret på instruktionen fra elfen.
# 
# Så. 
library(tidyverse)
tibble(x = 0, y = 0)
# 
# 
# x er øst/vest.
# y er nord/syd.
# 
# går vi mod nord, ^, øger vi y med 1.
# Går vi mod syd, v, mindsker vi y med 1.
# 
# I begge tilfælde er x uændret.
# 
# Så er der < og >. Der hhv mindsker og øger vi x med 1, og holder y uændret.
# 
# Når vi har gjort det for alle instruktionerne, grupperer vi og tæller.
# 
# Vi kan indeksere:

scheme <- list("^" = c(X = 0, Y = 1),
               "v" = c(X = 0, Y = -1),
               "<" = c(X = -1, Y = 0),
               ">" = c(X = 1, Y = 0))

koord <- function(x){
  scheme[[x]]
}

scheme[["^"]]

grid <- tibble(X = 0, Y = 0)

test <- "^v^v^v^v^v"
test <- "^>v<"
test <- ">"

instruks <- rbind(grid, test %>% str_split_1("") %>% as_tibble() %>% 
  transmute(koord = map(value, koord)) %>% 
  unnest_wider(koord))


instruks %>% 
  transmute(x = cumsum(X), y = cumsum(Y)) %>% 
  count(x, y)

input <- readLines("aoc2015/data/day-03-input.txt") 


instruks <- rbind(grid, input %>% str_split_1("") %>% as_tibble() %>% 
                    transmute(koord = map(value, koord)) %>% 
                    unnest_wider(koord))


instruks %>% 
  transmute(x = cumsum(X), y = cumsum(Y)) %>% 
  count(x, y) %>% nrow()

# Tjek. Korrekt!

# Nu laver vi så to sæt instrukser. Hvor vi deler input op i to. 

input <- "^v^v^v^v^v"
input <- input %>% str_split_1("") %>% as_tibble() %>% mutate(r_num = 1:nrow(.))

input_santa <- input %>% 
  filter(r_num %% 2 == 1)
input_robo_santa <- input %>% 
  filter(r_num %% 2 != 1)

instruks_santa <- rbind(grid, input_santa %>% 
                          transmute(koord = map(value, koord)) %>% 
                          unnest_wider(koord))

instruks_robo_santa <- rbind(grid, input_robo_santa %>% 
                          transmute(koord = map(value, koord)) %>% 
                          unnest_wider(koord))



instruks_santa <- instruks_santa %>% 
  transmute(x = cumsum(X), y = cumsum(Y)) 


instruks_robo_santa <- instruks_robo_santa %>% 
  transmute(x = cumsum(X), y = cumsum(Y)) 

rbind(instruks_robo_santa, instruks_santa) %>% 
  count(x, y) %>% nrow()


og det rigtige svar var: 2360