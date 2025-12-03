example <- c("987654321111111",
"811111111111119",
"234234234234278",
"818181911112111")

# To batterier skal slås til. Det første batteri skal være den største
# værdi, der ikke er den sidste. Det andet skal være den største 
# værdi der kommer efter den første vi fandt.


joltage <- function(bank){
  bank <- bank |> str_split_1("") |> as.numeric()
  first_battery <- bank[-length(bank)] |> max() 
  first_position <- which(bank == first_battery) |> min()
second_battery <- bank[(first_position)+1:(length(bank)-first_position)] |> 
  max()
  first_battery*10 + second_battery
}


tibble(input = example) |> 
  mutate(joltage = map_dbl(input, joltage))  |> 
  summarise(answer = sum(joltage))


tibble(input = readLines("aoc2025/input-03.txt")) |> 
  mutate(joltage = map_dbl(input, joltage))  |> 
  summarise(answer = sum(joltage))


part 2.

Det må handle om succesivt at fjerne de minste værdier - indtil der
kun er 12 tilbage. Og at fjerne den første mindste værdi først.



max_voltage <- function(bank){


}