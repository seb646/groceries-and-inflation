#### Preamble ####
# Purpose: Import raw csv data, clean it, and generate new csv files
# Author: Sebastian Rodriguez
# Email: me@srod.ca
# Date: TBD
# GitHub: https://github.com/seb646/groceries-and-inflation

#### Workspace set-up ####
library(tidyverse)
library(dplyr)
library(here)
library(readr)
library(janitor)
library(arrow)
library(lubridate)

#### Import and clean the raw inflation data ####
inflation_data <- readr::read_csv(
  here::here("inputs/data/INDINF_CPI.csv"),
  show_col_types = FALSE,
  skip = 20) |>

  # Change column naming format
  clean_names() |>

  # Select the desired columns
  select(date, indinf_cpi_q) |>

  mutate(date = str_replace(date, 'Q', ' Q')) |>

  rename("inflation_rate" = "indinf_cpi_q",)

inflation_data[c('year', 'quarter')] <- str_split_fixed(inflation_data$date, ' ', 2)

inflation_data <- inflation_data |>
  filter(year >= 2017)

# inflation_data$year <- paste(inflation_data$year, inflation_data$quarter)
# 
inflation_data <- inflation_data |>
  select(year, inflation_rate)

# Aggregate data by year and quarter, round summarized data to 2 digits
inflation_data <- 
  aggregate(
    inflation_data$inflation_rate, 
    list(inflation_data$year), 
    FUN = function(x) round(mean(x), digits = 1)
  ) |> 
  
  # Rename new columns
  rename(
    "year" = "Group.1", 
    "inflation_rate" = "x"
  )

# Create a new cleaned csv file
write_parquet(
  inflation_data,
  here::here("inputs/data/clean_inflation.parquet")
)

#### Import and clean the raw grocery pricing data ####
grocery_data <- readr::read_csv(
  here::here("inputs/data/1810024501-eng.csv"),
  show_col_types = FALSE,
  skip = 9) |>
  
  # Remove empty columns
  drop_na() |>
  
  # Clean column names
  clean_names()

# Split date column into unique year and quarter columns
grocery_data[c('quarter', 'year')] <- str_split_fixed(grocery_data$products, ' ', 2)

grocery_data <- grocery_data |>
  select(
    year,
    quarter,
    chicken_breasts_per_kilogram_3,
    bacon_500_grams_4,
    milk_2_litres_3,
    eggs_1_dozen_3,
    frozen_peas_750_grams_4,
    pasta_sauce_650_millilitres_4
  ) |>
  
  # Change months to fiscal quarters
  mutate(quarter = str_replace(quarter, 'January', 'Q1')) |>
  mutate(quarter = str_replace(quarter, 'February', 'Q1')) |>
  mutate(quarter = str_replace(quarter, 'March', 'Q1')) |>
  mutate(quarter = str_replace(quarter, 'April', 'Q2')) |>
  mutate(quarter = str_replace(quarter, 'May', 'Q2')) |>
  mutate(quarter = str_replace(quarter, 'June', 'Q2')) |>
  mutate(quarter = str_replace(quarter, 'July', 'Q3')) |>
  mutate(quarter = str_replace(quarter, 'August', 'Q3')) |>
  mutate(quarter = str_replace(quarter, 'September', 'Q3')) |>
  mutate(quarter = str_replace(quarter, 'October', 'Q4')) |>
  mutate(quarter = str_replace(quarter, 'November', 'Q4')) |>
  mutate(quarter = str_replace(quarter, 'December', 'Q4'))

# Set chicken breasts column to numeric (for some reason it was char)
grocery_data$chicken_breasts_per_kilogram_3 = as.numeric(grocery_data$chicken_breasts_per_kilogram_3)

# Aggregate data by year and quarter, round summarized data to 2 digits
grocery_data <- 
  aggregate(
    grocery_data[, 3:8], 
    list(grocery_data$year), 
    FUN = function(x) round(mean(x), digits = 2)
  ) |> 
  
  # Rename new columns
  rename(
    "year" = "Group.1", 
    "chicken" = "chicken_breasts_per_kilogram_3",
    "bacon" = "bacon_500_grams_4",
    "milk" = "milk_2_litres_3",
    "eggs" = "eggs_1_dozen_3",
    "frozen_peas" = "frozen_peas_750_grams_4",
    "pasta_sauce" = "pasta_sauce_650_millilitres_4"
  )

# Create a new cleaned parquet file
write_parquet(
  grocery_data,
  here::here("inputs/data/clean_grocery.parquet")
)