library(tidyverse)


c("123 328  51 64", 
  "45 64  387 23" ,
  "6 98  215 314",
  "*   +   *   +" ) |>
  as_tibble() |>
  mutate(value = str_squish(value)) |>      # laver flere mellemrum om til ét
  separate_wider_delim(
    value,
    delim = " ",                            # nu er ét space nok
    names_sep = "_"
  ) |> t() |> 
  as_tibble() |> 
  type_convert() |> 
  mutate(result = case_when(
    V4 == "*" ~
  ))
  