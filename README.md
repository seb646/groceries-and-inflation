# Can household groceries track inflation? 
This repository houses a project that seeks to examine whether household groceries can provide a metric for tracking inflation in Canada. It contains all of the files and code necessary for an analysis, and provides a paper summarizing the research and findings. 

> **Note**<br>
> The research paper associated with this study is available [here](https://github.com/seb646/groceries-and-inflation/blob/main/outputs/paper/paper.pdf).

## Getting Started

### Requirements

This project requires both the [R programming language](https://www.r-project.org/) and [Quarto](https://quarto.org/docs/get-started/). If you do not have these tools in your development environment, please install them now. You will also need an integrated development environment (IDE) capable of running R scripts. I recommend [RStudio](https://posit.co/products/open-source/rstudio/) (local) or [Posit Cloud](https://posit.cloud/) (cloud-based).

Once your environment is set up, you must install several packages that handle various tasks, like graphing data, creating tables, and general organization and processing. You will find a complete list of these packages in the file `scripts/00-install_dependencies.r`. You only need to run this file once to install the required dependencies.

### Download the data
The first step in working with this repository is downloading two data sets: one from Statistics Canada, and one from the Bank of Canada:

- The Bank of Canada's inflation data set is available [here](https://www.bankofcanada.ca/rates/indicators/capacity-and-inflation-pressures/inflation). Download the data in a CSV format.
- Statistics Canada's data set on the price of retail products is available [here](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810024501). Downloading the correct data from this data set is an involved process, and a step-by-step guide is available [here](). 

Once you download both data sets, place the two CSV files in `inputs/data`. At the end of this process, you should have two files in the aforementioned folder:

- `1810024501-eng.csv`: Statistics Canada's price of retail products data set
- `INDINF_CPI.csv`: The Bank of Canada Inflation Data Set

### Clean the data
Before moving to data analysis, we must clean the data to help us filter, format, and make use of the relevant data points. The `scripts/01-data_cleaning.r` file handles all of the data cleaning, including summarizing the data by year, selecting relevant years, and providing meaningful column names, among other things.

Run the file to fetch the raw data sets, clean them, and then create new `.parquet` files with the clean data. At the end of this process, you should have two new files in `inputs/data`: 

- `clean_grocery.parquet`
- `clean_inflation.parquet`

### Analyze the data
The core data analysis of this project occurs in the `outputs/paper/paper.qmd` Quarto document. Once you render `paper.qmd`, Quarto will generate a `paper.pdf` file in the same folder. The raw references used in `paper.qmd` are available under the same folder in the `references.bib` file.

## Debugging
### Test the data
If you're experiencing problems with the data, I've compiled a document that tests the data against several parameters, like data types, number ranges, etc. This testing document is available under the `scripts/03-data_testing.r` file. The file contains a number of tests to run on the two `.parquet` files. 

Before running these tests, you must first download and clean the data following the steps outlined above. All of these tests should return true. If they do not, feel free to [create an issue](https://github.com/seb646/groceries-and-inflation/issues/new).

### Simulate the data
If you'd like to debug the problem yourself, or if you'd like to use a service like Stack Overflow for help, it's important to have some simulated data to reproduce the problem. The `scripts/04-data_simulation.r` file generates random, fake data based on the cleaned information initially downloaded from Statistics Canada and the Bank of Canada.

## Acknowledgments

Created by [Sebastian Rodriguez](https://srod.ca), licensed under the [BSD 3-Clause License](https://github.com/seb646/groceries-and-inflation/blob/main/LICENSE). Contains data from Statistics Canada, licensed under the [Statistics Canada Open Licence](https://www.statcan.gc.ca/en/reference/licence). Created using [R](https://www.r-project.org/), an open-source statistical programming language.

This project uses a number of R packages, including: [arrow](https://cran.r-project.org/web/packages/arrow/index.html), [dplyr](https://cran.r-project.org/web/packages/dplyr/index.html), [ggplot2](https://cran.r-project.org/web/packages/ggplot2/index.html), [here](https://cran.r-project.org/web/packages/here/index.html), [janitor](https://cran.r-project.org/web/packages/janitor/index.html), [kableExtra](https://cran.r-project.org/web/packages/kableExtra/index.html), [knitr](https://cran.r-project.org/web/packages/knitr/index.html), [lubridate](https://cran.r-project.org/web/packages/lubridate/index.html), [readr](https://cran.r-project.org/web/packages/readr/index.html), [RColorBrewer](https://cran.r-project.org/web/packages/RColorBrewer/index.html), [scales](https://cran.r-project.org/web/packages/scales/index.html), and [tidyverse](https://cran.r-project.org/web/packages/tidyverse/index.html).

Thank you to Chloe Thierstein, Linrong Li, and Sagith Kalaichelvam for peer reviewing this project and providing invaluable guidance and insight. 

Much of this project's development was informed by [Rohan Alexander](https://rohanalexander.com/)'s book [*Telling Stories with Data*](https://tellingstorieswithdata.com/).
