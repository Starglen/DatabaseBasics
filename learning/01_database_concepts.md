# Database concepts and choosing a model

## What is a database?

A database is an organized collection of data. A database management system (DBMS) provides ways to define, query, protect, and maintain that data. An application usually talks to a DBMS rather than managing database files itself.

## Relational databases

Relational systems organize data into tables with defined columns. Primary keys identify rows; foreign keys express relationships and can enforce referential integrity. SQL is the common language for defining and querying relational data.

Relational databases are a strong choice when data has clear relationships, constraints matter, and multi-step changes need transactions. Examples include SQLite, PostgreSQL, MySQL, and SQL Server. They differ in syntax, supported features, deployment, and scaling characteristics.

## Other common data models

- **Document databases** store flexible, usually nested documents. They can fit records whose structure varies, but duplication and cross-document consistency need thought.
- **Key-value stores** associate a key with a value and are often used for caching or fast lookups.
- **Wide-column stores** organize data for large distributed workloads with access patterns designed in advance.
- **Graph databases** represent entities and their relationships directly, useful for relationship-heavy traversals.

No model is best for every task. Choose based on access patterns, consistency needs, data shape, operations, team skills, and the guarantees of a specific product—not because a technology is fashionable.

## Essential vocabulary

- **Schema:** structure and rules for stored data.
- **Table:** rows of records described by columns.
- **Primary key:** unique, non-null row identifier.
- **Foreign key:** reference to a key in another (or the same) table.
- **Constraint:** a rule such as `NOT NULL`, `UNIQUE`, `CHECK`, or a foreign key.
- **Query:** request to read or change data.
- **Index:** additional structure that can speed selected lookups, using storage and write work.
- **Transaction:** group of database operations treated as one unit.
- **Migration:** a versioned, reviewable change to a database schema or data.

## ACID, at a glance

- **Atomicity:** a transaction succeeds as a unit or is rolled back.
- **Consistency:** committed changes preserve defined rules and constraints.
- **Isolation:** concurrent transactions are controlled so their operations do not interfere in unintended ways; exact isolation behavior depends on the DBMS and configuration.
- **Durability:** committed changes survive failures according to the system's guarantees and configuration.

SQLite is used for this repo's small local lab. Use the labs to learn concepts, and consult the chosen DBMS documentation before applying engine-specific behavior in production.
