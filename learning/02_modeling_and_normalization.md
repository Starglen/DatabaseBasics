# Data modeling and normalization

A useful schema begins with the questions the application needs to answer. Identify entities, their attributes, and the relationships between them before writing `CREATE TABLE` statements.

## Model the library lab

The SQL lab uses four entities:

- **Author** — one row per author
- **Book** — one row per book, with a foreign key to its author
- **Member** — one row per library member
- **Loan** — one row per book checkout, referencing a member and a book

This represents one author to many books, and one member to many loans. A loan links one member to one book at a point in time. Foreign keys make these relationships explicit.

## Keys and integrity

Use a primary key to identify a row independently of changeable descriptive fields. Add `NOT NULL`, `UNIQUE`, and `CHECK` constraints for rules that belong in the database. A foreign key protects relationships, provided foreign-key enforcement is enabled by the database connection (SQLite requires enabling it per connection).

## Why normalization helps

Normalization reduces avoidable duplication and update anomalies. For example, putting an author's name in every book row means a spelling correction must update many rows. Keeping authors in an `authors` table and referring to an author ID lets the name be maintained once.

At a beginner level, aim to:

1. Keep each table focused on one kind of entity or relationship.
2. Store one value per field rather than lists hidden in a text cell.
3. Give each row a reliable key.
4. Store facts in one authoritative place where practical.
5. Use relationship tables when modeling many-to-many relationships.

Normalization is not an end in itself: some systems deliberately denormalize for performance or reporting. Do so based on measured needs, document how duplicated values stay consistent, and understand the trade-offs.

## Practice

Sketch an ER diagram for a school with students, courses, and enrollments. A student can take many courses, and a course can have many students. Decide which table represents the many-to-many relationship, and what attributes belong on that relationship.
