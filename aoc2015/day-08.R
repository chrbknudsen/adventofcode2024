library(tidyverse)
filnavn <- "aoc2015/data/day-08-input.txt"
input <- readLines("aoc2015/data/day-08-input.txt")

# " bliver escapet til \"
# \ bliver escapet til \\


# The only escape sequences used are 
# \\ (which represents a single backslash), 
# \" (which represents a lone double-quote character), and 
# \x plus two hexadecimal characters (which represents a single character with that ASCII code).
input[5]
str_replace_all(input[5], '\\\\"', "😀")



read.table("aoc2015/data/day-08-input.txt", sep = "\t", quote = "", comment.char = "", stringsAsFactors = FALSE)
library(stringi)
stri_unescape_unicode(input[6])

# \"byc\u009dyxuafof\\¦uf\\axfozomj\\olhj\"
# "byc\x9dyxuafof\\\xa6uf\\axfozomj\\olh\x6a"


# stri_unescape_unicode(input[6])

# "vqsremfk\x8fxiknektafj"
# \"vqsremfk\u008fxiknektafj\"

# 22 er "

con <- file(filnavn, open = "rb") 
bins <- readBin(con, what= "raw", n = 1000001L) 
bins <- as.character(bins)
sum(bins == "0a")
bins[1]
