# Normalized vs. Denormalized Databases

## Our Book Store Example

You should be familiar with these two schemas by now. They're both storing fictional company data on the sales of books in bulk to stores across the US and Canada. On the left, you have the star schema with denormalized dimension tables. On the right, you have the snowflake schema with normalized dimension tables. The normalized database looks way more complicated. And it is in some ways. For example, let's say you wanted to get the quantity of all books by Octavia E. Butler sold in Vancouver in Q4 of 2018.

## Query Comparison

### Denormalized Query

Based on the denormalized schema, you can run the following query to accomplish this. It's composed of 3 joins, which makes sense based on the three dimension tables in the star schema.

### Normalized Query

What would the query look like on the normalized schema? A lot longer. It doesn't even fit one slide!

There's a total of 8 inner joins. This makes sense based on the snowflake schema diagram. The normalized snowflake schema has considerably more tables. This means more joins, which means slower queries. So why would we want to normalize a database?

## Benefits of Normalization

### Space Efficiency

Normalization saves space. This isn't intuitive seeing how normalized databases have more tables. Let's take a look at the store table in our denormalized database. Here we see a lot of repeated information in bold - such as USA, California, New York, and Brooklyn. This type of denormalized structure enables a lot of data redundancy.

If we normalize that previous schema, we get this: We see that although we are using more tables, there is no data redundancy. The string, Brooklyn, is only stored once. And the state records are stored separately because many cities share the same state, and country. We don't need to repeat that information, instead, we can have one record holding the string California. Here we see how normalization eliminates data redundancy.

### Better Data Integrity

Normalization ensures better data integrity through its design. First, it enforces data consistency. Data entry can get messy, and at times people will fill out fields differently. For example, when referring to California, someone might enter the initials "CA". Since the states are already entered in a table, we can ensure naming conventions through referential integrity. 

Secondly, because duplicates are reduced, modification of any data becomes safer and simpler. Say in the previous example, you wanted to update the spelling of a state - you wouldn't have to find each record referring to the state, instead, you could make that change in the states table by altering one record. From there, you can be confident that the new spelling will be enacted for all stores in that state. 

Lastly, since tables are smaller and organized more by object, its easier to alter the database schema. You can extend a smaller table without having to alter a larger table holding all the vital data.

## Summary of Database Normalization

To recap, here are the pros and cons of normalization. Now normalization seems appealing, especially for database maintenance. However, normalization requires a lot more joins making queries more complicated, which can make indexing and reading of data slower. Deciding between normalization and denormalization comes down to how read- or write- intensive your database is going to be.

## OLTP vs OLAP Considerations

Remember OLTP and OLAP? Can you guess which prefers normalization? Take a pause and think about it. Did you get it right? OLTP is write-intensive meaning we're updating and writing often. Normalization makes sense because we want to add data quickly and consistently. OLAP is read-intensive because we're running analytics on the data. This means we want to prioritize quicker read queries. Remember how much more joins the normalized query had over the denormalized query? OLAP should avoid that.

## Practice Exercises

### Denormalized Query Exercise

- Select `state` from the appropriate table and the total `sales_amount`.
- Complete the JOIN on `book_id`.
- Complete the JOIN to connect the `dim_store_star` table
- Conditionally select for books with the `genre` `novel`.
- Group the results by state.

```sql
-- Output each state and their total sales_amount
SELECT dim_store_star.state, SUM(sales_amount)
FROM fact_booksales
    -- Join to get book information
    JOIN dim_book_star on dim_book_star.book_id = fact_booksales.book_id
    -- Join to get store information
    JOIN dim_store_star on dim_store_star.store_id = fact_booksales.store_id
-- Get all books with in the novel genre
WHERE  
    dim_book_star.genre = 'novel'
-- Group results by state
GROUP BY
    dim_store_star.state;
```

### Normalized Query Exercise

- Select `state` from the appropriate table and the total `sales_amount`.
- Complete the two JOINS to get the `genre_id`'s.
- Complete the three JOINS to get the `state_id`'s.
- Conditionally select for books with the `genre` `novel`.
- Group the results by state.

```sql
-- Output each state and their total sales_amount
SELECT dim_state_sf.state, SUM(sales_amount)
FROM fact_booksales
    -- Joins for genre
    JOIN dim_book_sf on dim_book_sf.book_id = fact_booksales.book_id
    JOIN dim_genre_sf on dim_genre_sf.genre_id = dim_book_sf.genre_id
    -- Joins for state 
    JOIN dim_store_sf on dim_store_sf.store_id = fact_booksales.store_id 
    JOIN dim_city_sf on dim_city_sf.city_id = dim_store_sf.city_id
    JOIN dim_state_sf on  dim_state_sf.state_id = dim_city_sf.state_id
-- Get all books with in the novel genre and group the results by state
WHERE  
    dim_genre_sf.genre = 'novel'
GROUP BY
    dim_state_sf.state;
```

### Schema Modification Exercise

- Add a `continent_id` column to `dim_country_sf` with a default value of 1. Note that`NOT NULL DEFAULT(1)` constrains a value from being null and defaults its value to `1`.
- Make that new column a foreign key reference to `dim_continent_sf`'s `continent_id`.

```sql
-- Add a continent_id column with default value of 1
ALTER TABLE dim_country_sf
ADD continent_id int NOT NULL DEFAULT(1);

-- Add the foreign key constraint
ALTER TABLE dim_country_sf ADD CONSTRAINT country_continent
   FOREIGN KEY (continent_id) REFERENCES dim_continent_sf(continent_id);
   
-- Output updated table
SELECT * FROM dim_country_sf;
```