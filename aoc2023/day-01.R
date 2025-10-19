example <- c("1abc2",
"pqr3stu8vwx",
"a1b2c3d4e5f",
"treb7uchet")

library(stringr)
str_extract(example, pattern = "\\d")
str_extract(example, pattern = "\\d(?=[^\\d]*$)")
library(tidyverse)
tibble(input = example) |> 
  mutate(first = str_extract(input, pattern = "\\d")) |> 
  mutate(last = str_extract(input, pattern = "\\d(?=[^\\d]*$)")) |>
  rowwise() |> 
  transmute(value = str_c(first, last, collapse ="")) |>
  ungroup() |> 
  mutate(value = as.numeric(value)) |> 
  summarise(answer = sum(value))

# correct!

readLines("aoc2023/data/day-01-input.R") |> 
  as_tibble() |> 
  rename("input" = value) |> 
  mutate(first = str_extract(input, pattern = "\\d")) |> 
  mutate(last = str_extract(input, pattern = "\\d(?=[^\\d]*$)")) |>
  rowwise() |> 
  transmute(value = str_c(first, last, collapse ="")) |>
  ungroup() |> 
  mutate(value = as.numeric(value)) |> 
  summarise(answer = sum(value))

# part 2

example <- c("two1nine",
"eightwothree",
"abcone2threexyz",
"xtwone3four",
"4nineeightseven2",
"zoneight234",
"7pqrstsixteen")


mappings <- c("one" = "1",
              "two" = "2",
              "three" = "3",
              "four" = "4",
              "five" = "5",
              "six" = "6",
              "seven" = "7",
              "eight" = "8",
              "nine" = "9"
        )
str_replace_all(example, mappings)

example |> 
  as_tibble() |> 
    mutate("original" = value) |> 
    rename("input" = value) |> 
    mutate(input = str_replace_all(input, mappings)) |> 
    mutate(first = str_extract(input, pattern = "\\d")) |> 
    mutate(last = str_extract(input, pattern = "\\d(?=[^\\d]*$)")) |>
    rowwise() |> 
    mutate(value = str_c(first, last, collapse ="")) |>
    ungroup() |> 
    mutate(value = as.numeric(value)) |> 
    summarise(answer = sum(value))



  map1 <- c("eight" = "8", "two" = "2", "three" = "3")
map2 <- c("three" = "3", "two" = "2", "eight" = "8")
map3 <- c("two" = "2", "three" = "3",  "eight" = "8")

# samlet mønster (rækkefølgen i map er ligegyldig her)
pat <- paste0("(", paste(names(map1), collapse = "|"), ")")

x <- "eightwothree"

str_replace_all(x, pat, \(m) map1[m])
str_replace_all(x, pat, \(m) map2[m])
str_replace_all(x, pat, \(m) map3[m])