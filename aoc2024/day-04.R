# 2024 - day 4

library(tidyverse)



tidligere arbejde

library(tidyverse)
example <- readLines("data/day-04-input.txt") %>% as_tibble()
example %>% 
  mutate(længde = nchar(value))

input <<- example %>% 
  transmute(values = str_split(value, "")) %>% 
  unnest_wider(values, names_sep = "") %>% 
  as.matrix()

example[[1,1]]

# For en given position, (x,y), er [x,y] == X?
#   Vi kan gå til øst
# Til vest.
# nord og syd 
# Vi kan gå nord-øst
# nord-vest
# syd-øst 
# og syd-vest
# 
# start_tjek <- function(x,y){
#   input[[x,y]] == "X"
# }
# 
# dim(example)[1]
# 
# # Husk at x,y i input er byttet om. det vi tænker som x når vi kigger på
# # matricen.
# # 
# # Så det jeg tænker som øst, er syd. Men input, både eksemplet og selve input
# # er kvadratisk. Så det ser vi bort fra.
# 
# 
# øst_tjek <- function(x,y){
#   if(x > dim(input)[1]-4){return(F)}
#   all(input[[x+1,y]] == "M",
#   input[[x+2,y]] == "A",
#   input[[x+3,y]] == "S")
# }
# 
# vest_tjek <- function(x,y){
#   if(x < 4){return(F)}
#   all(input[[x-1,y]] == "M",
#       input[[x-2,y]] == "A",
#       input[[x-3,y]] == "S")
# }
# 
# nord_tjek <- function(x,y){
#   if(y < 4){return(F)}
#   all(input[[x,y+1]] == "M",
#       input[[x,y+2]] == "A",
#       input[[x,y+3]] == "S")
# }
# 
# syd_tjek <- function(x,y){
#   if(y < dim(input)[2]-4){return(F)}
#   all(input[[x,y-1]] == "M",
#       input[[x,y-2]] == "A",
#       input[[x,y-3]] == "S")
# }
# 

# Hm...

# mere tidy?

# 
# 
# 
# Vi skal ikke køre dette direkte - for der er ikke nogen grund til at 
# gøre kønsfordelingen på vores kurser mere skæv end den er i forvejen. 
# 
# På KU er kønsfordelingen 62/38 i kvindernes favør.
# På vores kurser - med alskens forbehold, er fordelingen 70/30. Stadig i 
# kvindernes favør. Det er en statistisk signifikant underrepræsenation, relativt
# til populationen.
# 
# 
# På den anden side, lader det til at være ønskværdigt at gøre den skævere.
# 
# Men. Skulle man forsøge at gøre noget for at rent faktisk at opnå en mindre
# skæv balance. hvad skulle man så gøre?
#   
# Strik og kod tager udgangspunkt i en aktivitet der er kodet kvindeligt. Og 
# begrundelsen for kurset er at kvinder opleves som underrepræsenteret. 
# 
# De unge mænd er ikke marineret i maskulinistisk indignation. De ser, eller, 
# verbaliserer i hvert fald ikke, at deres faktiske underrepræsentation skulle være 
# problematisk.
# 
# Så vi kan ikke appelere til de unge mænd om at dukke op, med en budskab om
# uretfærdigheden i deres underrepræsentation.
# 
# sådan en workbook er selvfølgelig fin. Er det noget der skal overvejes?
#   
# 
# input

example <- readLines("data/day-04-input.txt") %>% as_tibble()

input <<- example %>% 
  transmute(values = str_split(value, "")) %>% 
  unnest_wider(values, names_sep = "")

tidy_input <<- input %>% 
  mutate(Y = 1:nrow(.), .before = 1) %>% 
  pivot_longer(starts_with("values"), names_to = "X", values_to = "bogstav") %>% 
  mutate(X = str_remove(X, "values")) %>% 
  mutate(X = as.numeric(X))

# Og nu passer x og y. Husk dog at vi tæller koordinater som i et billede.
# origo er i øvre venstre hjørne.

# tidy_test <- function(x,y){
#   if(tidy_input %>% filter(X== x, Y == y) %>% pull(bogstav) == "X"){
#     return("X fundet")
#   }else{
#     "nope"
#   }
# }


tidy_øst <- function(x,y){
  "XMAS" == tidy_input %>% 
    filter(X %in% (x + 0:3), 
                  Y == y) %>% 
    pull(bogstav) %>% 
    paste0(collapse = "")
}

tidy_vest <- function(x,y){
  "SAMX" == tidy_input %>% 
    filter(X %in% (x - 0:3),
           Y == y) %>% 
    pull(bogstav) %>% 
    paste0(collapse = "")
}

tidy_syd <- function(x,y){
  "XMAS" == tidy_input %>% 
    filter(X == x,
           Y %in% (y + 0:3)) %>% 
    pull(bogstav) %>% 
    paste0(collapse = "")
}

tidy_nord <- function(x,y){
  "SAMX" == tidy_input %>% 
    filter(X == x,
           Y %in% (y - 0:3)) %>% 
    pull(bogstav) %>% 
    paste0(collapse = "")
}


tidy_nord_øst <- function(x,y){
  "XMAS" == tibble(X = x + 0:3,
         Y = y - 0:3) %>% 
    left_join(tidy_input, by = join_by(X, Y)) %>% 
    pull(bogstav) %>% 
    paste0(collapse = "")
   
}


tidy_nord_vest <- function(x,y){
  "XMAS" == 
    tibble(X = x - 0:3,
               Y = y - 0:3) %>% 
    left_join(tidy_input, by = join_by(X, Y)) %>% 
    pull(bogstav) %>% 
    paste0(collapse = "")
  
}

tidy_syd_øst <- function(x,y){
  "XMAS" == tibble(X = x + 0:3,
                   Y = y + 0:3) %>% 
    left_join(tidy_input, by = join_by(X, Y)) %>% 
    pull(bogstav) %>% 
    paste0(collapse = "")
  
}

tidy_syd_vest <- function(x,y){
  "XMAS" == tibble(X = x - 0:3,
                   Y = y + 0:3) %>% 
    left_join(tidy_input, by = join_by(X, Y)) %>% 
    pull(bogstav) %>% 
    paste0(collapse = "")
  
}



# øst  3 ok
# vest 2 ok
# nord 2 ok
# syd  1 ok
# syd_øst 1 ok
# syd_vest 1 OK
# nord_øst



tidy_input %>% 
  filter(bogstav == "X") %>% 
  mutate(vest = map2(X, Y, tidy_vest)) %>% 
  mutate(øst = map2(X, Y, tidy_øst)) %>% 
  mutate(nord = map2(X, Y, tidy_nord)) %>% 
  mutate(syd = map2(X, Y, tidy_syd)) %>% 
  mutate(nord_øst = map2(X, Y, tidy_nord_øst)) %>% 
  mutate(nord_vest = map2(X, Y, tidy_nord_vest)) %>% 
  mutate(syd_øst = map2(X, Y, tidy_syd_øst)) %>% 
  mutate(syd_vest = map2(X, Y, tidy_syd_vest))  %>% 
  unnest(everything())  %>% 
  select(-c(Y,X,bogstav)) %>% as.matrix() %>% sum()


# Puha det må kunne gøres enklere.

# del 2

find alle A. er der i position 
  