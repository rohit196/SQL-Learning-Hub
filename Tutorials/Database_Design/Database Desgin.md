## What is Database Design?

Database design determines how data is logically stored. This is crucial because it affects how the database will be queried, whether for reading or updating data. There are two important concepts to know when it comes to database design: database models and schemas.

- **Database Models**: High-level specifications for database structure. The relational model, the most popular, defines rows as records and columns as attributes, enforcing rules such as each row having unique keys. Other models exist that do not enforce the same rules.
- **Schemas**: A database's blueprint, implementing the database model. It defines specific tables, fields, relationships, indexes, and views a database will have. Schemas must be respected when inserting structured data into a relational database.

## Data Modeling

The first step to database design is data modeling, an abstract design phase where we define a data model for the data to be stored. There are three levels to a data model:

- **Conceptual Data Model**: Describes what the database contains, such as entities, relationships, and attributes.
- **Logical Data Model**: Decides how these entities and relationships map to tables.
- **Physical Data Model**: Looks at how data will be physically stored at the lowest level of abstraction.

These three levels ensure consistency and provide a plan for implementation and use.

[Learn more about Data Models](https://en.wikipedia.org/wiki/Data_model)

## Example: Storing Songs

Refer to the ER-Diagram in the repository.

Here is a simplified example where we want to store songs. The entities are songs, albums, and artists with various attributes. Their relationships are denoted by blue rhombuses. This is a conceptual idea of the data we want to store.

### Relational Model Schema

Here is a corresponding schema using the relational model. The fastest way to create a schema is to translate the entities into tables. However, just because it's the easiest, doesn't mean it's the best. Let's look at some other ways this ER diagram could be converted.

## Other Database Design Options

For example, you could opt to have one table to avoid running many joins to get song information. Alternatively, you could add tables for genre and label. Many songs share these attributes, and having one place for them helps with data integrity. The biggest difference here is how the tables are determined. There are different pros and cons to these examples. The next chapter on normalization and denormalization will expand on this.

## Beyond the Relational Model

From the prerequisites, you should be familiar with the relational model. Dimensional modeling is an adaptation of the relational model specifically for data warehouses. It's optimized for OLAP queries that aim to analyze rather than update. To do this, it uses the star schema. In the next chapter, we'll delve into that more. As we will see, the schema of a dimensional model tends to be easy to interpret and extend, which is a big plus for analysts working on the warehouse.

## Elements of Dimensional Modeling

Dimensional models are made up of two types of tables: fact and dimension tables.

- **Fact Tables**: Hold records of a key metric, which changes often. They also hold foreign keys to dimension tables.
- **Dimension Tables**: Hold descriptions of specific attributes that do not change as often.

For example, in analyzing songs, the fact table (songs) contains foreign keys to dimension tables (albums, artists). The records in fact tables often change as new songs get inserted. Albums, labels, artists, and genres will be shared by more than one song, so records in dimension tables won't change as much. To decide the fact table in a dimensional model, consider what is being analyzed and how often entities change.
