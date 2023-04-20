#### Preamble ####
# Purpose: Read in data from Statistics Canada and the Bank of Canada
# Prerequisites: Need to know where to get Statistics Canada and Bank of Canada data
# Author: Sebastian Rodriguez
# Email: me@srod.ca
# Date: TBD
# GitHub: https://github.com/seb646/groceries-and-inflation

#### Workspace set-up ####
library(tidyverse) # A collection of data-related packages
library(janitor) # Helps clean datasets
set.seed(124) # Set the seed for consistent randomness

#### Simulate Grocery Prices Data ####
grocery_data <- 
  tibble(
    "year" = c(2017:2022),
    "chicken" = round(
      runif(
        6, # Sample size
        11, # Min value
        15 # Max value
      ), 
      2 # Rounded decimal
    ),
    "bacon" = round(
      runif(
        6, # Sample size
        5, # Min value
        7.5 # Max value
      ), 
      2 # Rounded decimal
    ),
    "eggs" = round(
      runif(
        6, # Sample size
        3, # Min value
        4.5 # Max value
      ), 
      2 # Rounded decimal
    ),
    "milk" = round(
      runif(
        6, # Sample size
        4, # Min value
        5 # Max value
      ), 
      2 # Rounded decimal
    ),
    "frozen_peas" = round(
      runif(
        6, # Sample size
        2.8, # Min value
        3.5 # Max value
      ), 
      2 # Rounded decimal
    ),
    "pasta_sauce" = round(
      runif(
        6, # Sample size
        2, # Min value
        3 # Max value
      ), 
      2 # Rounded decimal
    ),
  )

#### Simulate Inflation Rate Data ####
inflation_data <- 
  tibble(
    "year" = c(2017:2022),
    "inflation_rate" = round(
      runif(
        6, # Sample size
        0, # Min value
        7 # Max value
      ), 
      2 # Rounded decimal
    )
  )