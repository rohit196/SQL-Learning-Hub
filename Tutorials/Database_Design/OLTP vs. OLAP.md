## Organizing and Managing Data

How should we organize and manage data? To answer this, we have to consider the different schemas, management options, and objects that make up a database. Some examples are listed here.

There is no one right answer to this motivating question. It will come down to how the data will be used.

## OLTP and OLAP

OLTP and OLAP are approaches to processing data. They help define the way data is going to flow, be structured, and stored. If you figure out which fits your business case, designing your database will be much easier.

- **OLTP** stands for Online Transaction Processing.
- **OLAP** stands for Online Analytical Processing.

As the names hint, the OLTP approach is oriented around transactions, while the other is oriented around analytics.

### Use Cases

Before going into formal definitions, let's look at some use cases of each:

- **Bookstore Example**:
    - **OLTP**: Keep track of the prices of books, insert sales as customers finish paying, track when employees have worked.
    - **OLAP**: Analyze the most profitable books, perform sophisticated analysis on sales (e.g., most loyal customers), run analysis on who deserves employee of the month.

Are you starting to see their differences? OLTP focuses on supporting day-to-day operations, while OLAP tasks are vaguer and focus on business decision-making.

### Characteristics

- **OLTP Systems**:
    - Application-oriented (e.g., bookkeeping).
    - Data is a current snapshot of transactions that are archived often.
    - Commonly executed queries are simpler and require quick queries or updates.
    - Used by more people throughout a company and even a company's customers.

- **OLAP Systems**:
    - Oriented around a certain subject under analysis (e.g., last quarter's book sales).
    - Data tends to be from over a large period of time and consolidated for long-term analysis.
    - Require more complex queries for analysis.
    - Typically used by analysts and data scientists at a company.

### Interdependence

OLAP and OLTP systems work together; in fact, they need each other. OLTP data is usually stored in an operational database that is pulled and cleaned to create an OLAP data warehouse. Without transactional data, no analyses can be done in the first place. Analyses from OLAP systems are used to inform business practices and day-to-day activity, thereby influencing the OLTP databases.

### Conclusion

Before implementing anything, figure out your business requirements because there are many design decisions you'll have to make. The way you set up your database now will affect how it can be effectively used in the future. Start by figuring out if you need an OLAP or OLTP approach, or perhaps both! These are the two most common approaches. However, they are not exhaustive, but they are an excellent start to get you on the right path to designing your database. In later videos, we'll learn more about the technical differences between both approaches.