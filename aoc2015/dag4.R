# dag 4 2015


library(openssl)
md5("abcdef609043")
startsWith(md5("abcdef609043"), "00000")

fivezeroes <- function(x, pad = "abcdef"){
 startsWith(md5(paste0(pad, x)), "00000")
}

sixzeroes <- function(x, pad = "abcdef"){
  startsWith(md5(paste0(pad, x)), "000000")
}


fivezeroes(1048970, pad = "pqrstuv")

iwrupvqb
res <- FALSE
i <- 0
answer <- while(!res){
  res <- fivezeroes(i, pad = "iwrupvqb" )
  if(res){
    print(i)}
  i <- i+1
}

# Af en eller anden årsag fik jeg ikke returneret svaret. men så kan
# man printe det... 346386



res <- FALSE
i <- 0
answer <- while(!res){
  res <- sixzeroes(i, pad = "iwrupvqb" )
  if(res){
    print(i)}
  i <- i+1
}
9958218 var svaret. Det tager tid...