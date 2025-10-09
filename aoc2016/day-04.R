

input <- c("aaaaa-bbb-z-y-x-123[abxyz]",
"a-b-c-d-e-f-g-h-987[abcde]",
"not-a-real-room-404[oarel]" ,
"totally-real-room-200[decoy]")

input <- tibble(input = input) |> 
  extract(
    input,
    into = c("bogstaver", "tal", "indhold"),
    regex = "([A-Za-z-]+)(\\d+)\\[([^\\]]+)\\]"
  ) |> 
  mutate(bogstaver = str_remove_all(bogstaver, "-"))

checksum funktionen

checksum <- function(input){
  str_split_1(input, "") |> table() |> 
  as.data.frame() |> 
  arrange(desc(Freq), Var1) |> 
  mutate(Var1 = as.character(Var1)) |> 
  slice(1:5) |> 
  pull(Var1) |> 
  paste0(collapse = "")
}

input |> 
  mutate(egencheck = map(bogstaver, checksum)) |> 
  unnest(egencheck) |> 
  filter(indhold == egencheck) |> 
  summarise(svar= sum(as.numeric(tal)))
 

input <- readLines("aoc2016/data/04-input.txt")
input <- tibble(input = input) |> 
  extract(
    input,
    into = c("bogstaver", "tal", "indhold"),
    regex = "([A-Za-z-]+)(\\d+)\\[([^\\]]+)\\]"
  ) |> 
  mutate(bogstaver = str_remove_all(bogstaver, "-"))


input |> 
  mutate(egencheck = map(bogstaver, checksum)) |> 
  unnest(egencheck) |> 
  filter(indhold == egencheck) |> 
  summarise(svar= sum(as.numeric(tal)))


# part 2

vi skal bruge en funktion der roterer bogstaerne.

length(LETTERS)

de_shift_letter <- function(letter, id){
  letters[(which(letters == letter) +id) %% 26]

}

de_shift("t", 343)

de_shift_string <- function(string, id){
  str_split_1(string, "")
}
de_shift_letter(de_shift_string("abdc"), 343)
