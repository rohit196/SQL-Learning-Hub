## SQL

Most of the world's data live in databases, so learning how to access and extract insights from these data is an essential skill for any data scientist. SQL, or S-Q-L, stands for Structured Query Language, and is the native language for working with databases.

## SQL Server & Transact-SQL

SQL Server is a popular relational database system developed by Microsoft. Transact-SQL, or T-SQL, is Microsoft's implementation of SQL, with additional functionality. In this course, you will master the fundamentals of T-SQL and become prepared to work with SQL Server databases by writing queries, or statements.

## Let's get started!

Let's get started!

## Querying 101

Think of going to the supermarket - we have a store full of goods - that's our database. We want to fill our cart with products, and those products are our query results. Unlike the supermarket, we can't physically retrieve our data and manipulate it, so we write queries to make this happen. The key term when retrieving data from tables is SELECT.

## Anatomy of a simple SELECT query

SELECT statements specify what we want to retrieve from a table. The simplest query selects one column from one table. In this query, we select the description column from the table 'grid'. Note the semicolon which denotes the end of the query. The other keyword you will always need is FROM - to specify the location of the source table. Here are the results. By default, the query returns every row in the selected column.

## Selecting more than one column

You can select multiple columns, separating each column name with a comma. However, you don't need a comma for the final column selected before 'FROM'.

## Query formatting

Here are two similar queries, with different layouts. The top query shows all the columns to be selected in one line. The bottom query shows each selected column on a new line. The results of both queries will be identical. We will mainly use the bottom layout throughout the course. Keeping keywords such as SELECT and FROM in uppercase, and table and column names in lowercase, makes queries easier to read.

## Select TOP ()

Instead of returning every row, we can use TOP() to limit the number of rows returned. Specify the number of rows to return between the brackets. You can also specify a percentage of rows to return using TOP N PERCENT, where N is the percent of rows to return. Using SELECT with TOP is a good way to get a quick view of the contents of a table.

## Select DISTINCT

Use SELECT DISTINCT to return a list of unique values from a column. If you use SELECT DISTINCT with two or more columns, you'll return each unique combination of values.

## Select *

Use SELECT, followed by the star, or asterisk key, to return all the rows and columns in a table. This is fine for quick exploration of small tables, but not for very large tables or production code. It's better to explicitly SELECT columns so that your queries produce reliable outputs.

## Aliasing column names with AS

You can rename, or ALIAS, a column to make your results more meaningful. Simply select the column, followed by AS, and then your desired column name. Note how demand_loss_mw is returned as lost_demand, while description is returned as cause_of_outage.

```sql
-- Limit the number of rows returned
SELECT 
    TOP (50) points 
FROM 
    eurovision;
```