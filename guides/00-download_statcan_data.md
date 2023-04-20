# Download Data from the NORC's General Social Survey (GSS)
Navigate to Statistics Canada's [Monthly average retail prices for selected products](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810024501) data set. 


## Step 1: Customize data
The first step is to open the data set's full customization table. Below the "customize table" window, click "Add/Remove data". 

[![Step 1](https://raw.githubusercontent.com/seb646/happiness-and-altruism/main/guides/images/00-01-dataset.png)](https://raw.githubusercontent.com/seb646/happiness-and-altruism/main/guides/images/00-01-dataset.png)

## Step 2: Select relevant products
Once in the expanded customization table, keep the "Canada" region selected to view metrics on the entire country. Then click on the "Products" tab to see a list of all available products.

[![Step 2: Add data sets to "Extracts"](https://raw.githubusercontent.com/seb646/happiness-and-altruism/main/guides/images/00-01-dataset.png)](https://raw.githubusercontent.com/seb646/happiness-and-altruism/main/guides/images/00-01-dataset.png)

Once in the "Products" tab, de-select all options. Then find and select the following options:

- Chicken breasts, per kilogram
- Bacon, 500 grams
- Milk, 2 litres
- Eggs, 1 dozen
- Frozen peas, 750 grams
- Pasta sauce, 650 millilitres

## Step 3: Set the reference period
After selecting the desired products, click on the "Reference period" tab to select a date range. Although data is available for 2023, as of this paper's writing, the year is incomplete and thus will not me meaningful in a year-over-year analysis. Select the "from" date as "January 2017" and the "to" date as "December 2022". 

[![Step 3: Create extract](https://raw.githubusercontent.com/seb646/happiness-and-altruism/main/guides/images/00-02-view_extracts.png)](https://raw.githubusercontent.com/seb646/happiness-and-altruism/main/guides/images/00-02-view_extracts.png)

## Step 4: Customize layout
By default, the interface will organize dates as columns and products as rows. This provides challenges when importing the data set, so we must reorganize the layout. Ensure the following preferences are selected: 

- **Georgraphy:** Column
- **Products:** Column
- **Reference period:** Row
- **Vector identifier** and **coordinate**: Unselected

[![Step 4: Name extract](https://raw.githubusercontent.com/seb646/happiness-and-altruism/main/guides/images/00-03-create_extract.png)](https://raw.githubusercontent.com/seb646/happiness-and-altruism/main/guides/images/00-03-create_extract.png)

## Step 5: Apply the changes
This is an important step as it refreshes the fetched data to reflect all of the changes we made in the previous step. 

Click the "Apply" button at the bottom of the "Customize table" window. 

## Step 6: Download the dataset
Once you've applied the changes, double check that the changes you made are reflected in the displayed data. After confirming, you may download the data set. 

Click the "Download options" button above the data and below the "Customize table" window. This will open a pop-up window, shown below, with various download options.

Select the first download option, titled "CSV Download as displayed". Ensure this is the very first option. 

[![Step 6: Set extract output options](https://raw.githubusercontent.com/seb646/happiness-and-altruism/main/guides/images/00-05-extract_output_options.png)](https://raw.githubusercontent.com/seb646/happiness-and-altruism/main/guides/images/00-05-extract_output_options.png) 

## Step 7: Preview CSV file 
After downloading the CSV file, open it in your preferred CSV editor (like Microsoft Excel) and ensure it matches the example a below. If it does not, repeat this process until it does or open an issue. 

[![Step 7: Download extract](https://raw.githubusercontent.com/seb646/happiness-and-altruism/main/guides/images/00-06-download_extract.png)](https://raw.githubusercontent.com/seb646/happiness-and-altruism/main/guides/images/00-06-download_extract.png)

## Step 8: Move file into repository
After confirming the file displays accurate information, move it into the `inputs/data` folder. 