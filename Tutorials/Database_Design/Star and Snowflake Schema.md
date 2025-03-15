# Star and Snowflake Schema

## Star Schema

The star schema is the simplest form of the dimensional model. Some use the terms "star schema" and "dimensional model" interchangeably. Remember that the star schema is made up of two tables: fact and dimension tables. Fact tables hold records of metrics that are described further by dimension tables. Throughout this chapter, we are going to use another bookstore example. However, this time, you work for a company that sells books in bulk to bookstores across the US and Canada. You have a database to keep track of book sales. Let's take a look at the star schema for this database.

### Star Schema Example

Excluding primary and foreign keys, the fact table holds the sales amount and quantity of books. It's connected to dimension tables with details on the books sold, the time the sale took place, and the store buying the books. You may notice the lines connecting these tables have a special pattern. These lines represent a one-to-many relationship. For example, a store can be part of many book sales, but one sale can only belong to one store. The star schema got its name because it tends to look like a star with its different extension points.

## Snowflake Schema

Now that we have a good grasp of the star schema, let's look at the snowflake schema. The snowflake schema is an extension of the star schema. Off the bat, we see that it has more tables. You may not be able to see all the details in this slide, but don't worry it will be broken down in later slides. The information contained in this schema is the same as the star schema. In fact, the fact table is the same, but the way the dimension tables are structured is different. We see that they extend more, hence its namesake.

### Same Fact Table, Different Dimensions

The star schema extends one dimension, while the snowflake schema extends over more than one dimension. This is because the dimension tables are normalized.

### What is Normalization?

Normalization is a technique that divides tables into smaller tables and connects them via relationships. The goal is to reduce redundancy and increase data integrity. There are several forms of normalization, which we'll delve into later. But the basic idea is to identify repeating groups of data and create new tables for them. Let's go back to our example to see how these tables were normalized.

### Book Dimension of the Star Schema

Here's the book dimension in the star schema. What could be repeating here? Primary keys are inherently unique. For book titles, although there is possible repeat here, it is not common. On the other hand, authors often publish more than one book, publishers definitely publish many books, and a lot of books share genres. We can create new tables for them, and it results in the following snowflake schema:

### Book Dimension of the Snowflake Schema

Do you see how these repeating groups now have their own table?

### Store Dimension of the Star Schema

On to the store dimension! City, states, and countries can definitely have more than one bookstore within them.

### Store Dimension of the Snowflake Schema

Here are the normalized dimension tables representing the bookstores. Do you notice that the way we structure these repeating groups is a bit different from the book dimension? An author can have published in different genres and with various publishers, hence why they were different dimensions. However, a city stays in the same state and country; thus, they extend each other over three dimensions.

### Time Dimension

The same is done for the time dimension. A day is part of a month that is part of a quarter, and so on!

### Snowflake Schema

And here we put all the normalized dimensions together to get the snowflake schema.

## SQL Constraints and Table Creation

- In the constraint called `sales_book`, set `book_id` as a foreign key.
- In the constraint called `sales_time`, set `time_id` as a foreign key.
- In the constraint called `sales_store`, set `store_id` as a foreign key.

```sql
-- Add the book_id foreign key
ALTER TABLE fact_booksales ADD CONSTRAINT sales_book
    FOREIGN KEY (book_id) REFERENCES dim_book_star (book_id);
    
-- Add the time_id foreign key
ALTER TABLE fact_booksales ADD CONSTRAINT sales_time
    FOREIGN KEY (time_id) REFERENCES dim_time_star(time_id);
    
-- Add the store_id foreign key
ALTER TABLE fact_booksales ADD CONSTRAINT sales_store
    FOREIGN KEY (store_id) REFERENCES dim_store_star (store_id);
```

- Create `dim_author` with a column for `author`.
- Insert all the distinct authors from `dim_book_star` into `dim_author`.

```sql
-- Create dim_author with an author column
CREATE TABLE dim_author (
    author VARCHAR(256)  NOT NULL
);

-- Insert authors into the new table
INSERT INTO dim_author
SELECT DISTINCT author FROM dim_book_star;
```

- Alter `dim_author` to have a primary key called `author_id`.
- Output all the columns of `dim_author`.

```sql
-- Create a new table for dim_author with an author column
CREATE TABLE dim_author (
    author varchar(256)  NOT NULL
);

-- Insert authors 
INSERT INTO dim_author
SELECT DISTINCT author FROM dim_book_star;

-- Add a primary key 
ALTER TABLE dim_author ADD COLUMN author_id SERIAL PRIMARY KEY;

-- Output the new table
SELECT * FROM dim_author;
```
