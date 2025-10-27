# aod 2022 day 1


# et antal elfer. Hver elf adskilt af en blank linie i data. De efterfølgende er tal som vi skal
# have lagt sammen. Vi skal finde den største sum.

library(tidyverse)
input <- readLines("aoc2022/data/day-01-input.txt")


example <- c("1000", "2000", "3000", "", "4000", "", "5000", "6000", "", "7000", "8000", "9000", "", "10000")
tibble(cal = example) |> 
  mutate(elf = as.numeric(cal == "")) |> 
  mutate(elfo = cumsum(elf)) |> 
  mutate(elf = elfo + 1) |> 
  filter(cal != "") |> 
  mutate(cal = as.numeric(cal)) |> 
  group_by(elf) |> 
  summarise(tot_cal = sum(cal)) |> 
  slice_max(tot_cal)

# Korrekt

tibble(cal = input) |> 
  mutate(elf = as.numeric(cal == "")) |> 
  mutate(elfo = cumsum(elf)) |> 
  mutate(elf = elfo + 1) |> 
  filter(cal != "") |> 
  mutate(cal = as.numeric(cal)) |> 
  group_by(elf) |> 
  summarise(tot_cal = sum(cal)) |> 
  slice_max(tot_cal, n =3) |> 
  summarise(svar = sum(tot_cal))

# korrekt
