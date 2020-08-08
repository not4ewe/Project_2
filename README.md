# Project-2
ETL project (Extract, Transform, Load)

## Project Report

### The Original Data Sources
https://www.kaggle.com/nickhould/craft-cans

### Required Data Cleaning and Transformation

- Read CSV to Jupyter Notebook using Pandas in order to extract data and create two dataframes
- Renamed columns in order to merge and set as index, removed unnecessary columns
- Altered table in order to display proper values in ‘abv’, identified the need to change INT to REAL in ‘abv’ column. ALTER TABLE in order to complete this task. Also, clear all data in table prior to change, change, and then reload data in order to accommodate new change. 
- Initially, used INNER JOINS to query data in order to aggregate 
 - Averaged columns
 - Counted values
 - LIKE function using wildcards ‘%’
- Merged dataframes in order to reduce JOIN queries in SQL
- Exported new cleaned dataframes to CSV files
- Created Results table? 

### Final databases, tables/collections

Created ‘merged-db’ in Panda for ease of accessibility of queried data, formed ‘merged’ table in SQL in order to query- this technique was used to eliminate referencing joins for efficient coding and reduced query time. 

Timed Results:

INNER JOIN- 220msec

MERGED-203msec

17msec SAVED, 8% reduction in time
