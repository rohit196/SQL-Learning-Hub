**Structuring data**

Data can be stored in three different levels:

1. **Structured data**: Defined by schemas, with data types and tables, and relationships between tables using concepts like foreign keys.
2. **Unstructured data**: Schemaless and in its rawest form, meaning it's not clean. Examples include media files and raw text.
3. **Semi-structured data**: Does not follow a larger schema but has an ad-hoc self-describing structure. Examples include NoSQL, XML, and JSON.

**3. Structuring data**

Structured data is easier to analyze because it is clean and organized. However, it is less flexible and scalable due to the need to follow a schema.

1. Flower by Sam Oth and Database Diagram by Nick Jenkins via Wikimedia Commons https://commons.wikimedia.org/wiki/File:Languages_xml.png

**4. Storing data beyond traditional databases**

Traditional databases generally follow relational schemas and are used for OLTP. Data warehouses became popular for OLAP approaches, and now data lakes are used to store and analyze even more data in the age of big data.

**5. Data warehouses**

Data warehouses are optimized for read-only analytics. They combine data from multiple sources and use massively parallel processing for faster queries. Typically, they use dimensional modeling and a denormalized schema, which we will cover later in the course. Amazon, Google, and Microsoft offer data warehouse solutions known as Redshift, Big Query, and Azure SQL Data Warehouse, respectively. A data mart is a subset of a data warehouse dedicated to a specific topic, allowing departments easier access to relevant data.

**6. Data lakes**

Technically, traditional databases and warehouses can store unstructured data, but not cost-effectively. Data lake storage is cheaper because it uses object storage instead of traditional block or file storage. This allows for the effective storage of massive amounts of data of all types, from streaming data to operational databases. Data lakes are massive, often petabytes in size (1,000 terabytes), because they store all the data that might be used. Unstructured data is the most scalable, which permits this size.

Data lakes are schema-on-read, meaning the schema is created as data is read. In contrast, warehouses and traditional databases are schema-on-write because the schema is predefined. Data lakes must be well-organized and cataloged; otherwise, they become "data swamps." Data lakes aren't limited to storage; it's becoming popular to run analytics on them. This is especially true for tasks like deep learning and data discovery, which require a lot of data that doesn't need to be very "clean." The big three cloud providers all offer data lake solutions.


**7. Extract, Transform, Load (ETL) or Extract, Load, Transform (ELT)**

When considering where to store data, it's important to think about how data will be transferred and in what form. ETL and ELT are two approaches for describing data flows.

- **ETL (Extract, Transform, Load)**: This traditional approach is commonly used for warehousing and smaller-scale analytics. Data is extracted from sources, transformed to fit the storage schema, and then loaded into the storage system, such as a data warehouse.
- **ELT (Extract, Load, Transform)**: This approach has become popular with big data projects. Data is extracted and loaded in its native form into a storage solution like a data lake. Portions of the data are then transformed as needed for various purposes, such as building a data warehouse or performing deep learning.

Both methods involve building data pipelines, but we will not delve into those intricacies here.
