#### Preamble ####
# Purpose: Testing Data from Statistics Canada and the Bank of Canada
# Prerequisites: Need to have downloaded the data
# Author: Sebastian Rodriguez
# Email: me@srod.ca
# Date: April 20, 2023
# GitHub: https://github.com/seb646/groceries-and-inflation

#### Workspace set-up ####
library(tidyverse)
library(janitor)
library(here)
library(arrow)

#### Test the clean grocery data #### 
# Fetch the the clean grocery data
grocery_data <- arrow::read_parquet(here::here("inputs/data/clean_grocery.parquet"), show_col_types = FALSE)
grocery_data
# Test that the year is greater than or equal to 2017, the start of the data set
grocery_data$year |> max() >= 2017

# Test that the grocery items are greater than zero, as a sold product they will never be less than zero
grocery_data$chicken |> min() >= 0
grocery_data$bacon |> min() >= 0
grocery_data$milk |> min() >= 0
grocery_data$eggs |> min() >= 0
grocery_data$frozen_peas |> min() >= 0
grocery_data$pasta_sauce |> min() >= 0

# Test that the grocery item values are numbers
grocery_data$chicken |> class() == "numeric"
grocery_data$bacon |> class() == "numeric"
grocery_data$milk |> class() == "numeric"
grocery_data$eggs |> class() == "numeric"
grocery_data$frozen_peas |> class() == "numeric"
grocery_data$pasta_sauce |> class() == "numeric"

#### Test the clean inflation data #### 
# Fetch the the clean inflation data
inflation_data <- arrow::read_parquet(here::here("inputs/data/clean_inflation.parquet"), show_col_types = FALSE)

# Test that the year is greater than or equal to 2017, the start of the data set
inflation_data$year |> max() >= 2017

# Test that the inflation rate is greater than zero - although this number can be negative, if it is there are probably bigger problems for you to worry about...
inflation_data$inflation_rate |> min() >= 0

# Test that the inflation rate is less than 100 - again, this can be greater than 100%, but if that happens stop worrying about groceries and save Canada's economy :(
inflation_data$inflation_rate |> max() <= 100

# Test that the inflation rate is a number
inflation_data$inflation_rate |> class() == "numeric"