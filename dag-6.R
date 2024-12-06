# dag 6
library(tidyverse)

input <<- readLines("data/dag-6-test") %>%
  as_tibble() %>% 
  transmute(values = str_split(value, "")) %>% 
  unnest_wider(values, names_sep = "") %>% 
  as.matrix()


start_position <- function(input, marker){
  which(input == marker, arr.ind = T) %>% 
    as_tibble() %>% 
    mutate(dir = marker)
}

which(input == "^", arr.ind = T)  %>% 
  as_tibble()

positioner <- start_position(input, "^")

col <- 5
row <- 7

dir <- "^"


if(dir == "^"){
  if(row == 1){return("DONE")}
  if(input[row-1,col] == "#"){
    return(tibble(row = row, col = col, dir = ">"))
  }else{
    return(tibble(row = row - 1, col = col, dir = "dir"))
  }
}

if(dir == "v"){
  if(row == dim(input)[1]){return("DONE")}
  if(input[row+1,col] == "#"){
    return(tibble(row = row, col = col, dir = "<"))
  }else{
    return(tibble(row = row + 1, col = col, dir = "dir"))
  }
}



if(dir == "<"){
  if(col == 1) {return("DONE")}
  if(input[row,col-1] == "#"){
    return(tibble(row = row, col = col, dir = "^"))
  }else{
    return(tibble(row = row, col = col-1, dir = "dir"))
  }
}

if(dir == ">"){
  if(row == dim(input)[2]){return("DONE")}
  if(input[row,col+1] == "#"){
    return(tibble(row = row, col = col, dir = "v"))
  }else{
    return(tibble(row = row, col = col+1, dir = "dir"))
  }
}
<>v




