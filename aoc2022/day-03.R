# aoc 2022 day 3

example <- c("vJrwpWtwJgWrhcsFMMfFFhFp",
"jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
"PmmdzqPrVvPwwTWBwg",
"wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
"ttgJtRGJQctTZtZT",
"CrZsJsPPZsGzwwsLwLmpwMDw")

shared <- function(items){
  items <- str_split_1(items, pattern = "")
  first <- items[1:(length(items)/2)]
  second <- items[(1+length(items)/2):length(items)]
  unique(first[first %in% second])
}

priority <- 1:52
names(priority) <- c(letters, LETTERS)

priority[map(example, shared) |> unlist()] |> sum()

input <- readLines("aoc2022/data/day-03-input.txt")
priority[map(input, shared) |> unlist()] |> sum()

# Part 1 korrekt

# part 2.

shared <- function(items_1, items_2, items_3){
  items_1 <- str_split_1(items_1, pattern = "")
  items_2 <- str_split_1(items_2, pattern = "")
  items_3 <- str_split_1(items_3, pattern = "")
  kand_a <- unique(items_1[items_1 %in% items_2])
  kand_a[kand_a %in% items_3]
}

badges <- tibble(input =example) |> 
  mutate(nrow = row_number()) |> 
  mutate(gr_no = ((nrow-1)%/% 3)+1) |> 
  select(-nrow) |> 
  group_by(gr_no) |> 
  mutate(elf = 1:3) |> 
  pivot_wider(names_from = elf, values_from = input, names_prefix = "elf") |> 
  rowwise() |> 
  mutate(badge = shared(elf1, elf2, elf3)) |> 
  pull(badge)


priority[badges] |> sum()


badges <- tibble(input =input) |> 
  mutate(nrow = row_number()) |> 
  mutate(gr_no = ((nrow-1)%/% 3)+1) |> 
  select(-nrow) |> 
  group_by(gr_no) |> 
  mutate(elf = 1:3) |> 
  pivot_wider(names_from = elf, values_from = input, names_prefix = "elf") |> 
  rowwise() |> 
  mutate(badge = shared(elf1, elf2, elf3)) |> 
  pull(badge)


priority[badges] |> sum()
