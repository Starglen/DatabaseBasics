# Database Basics: a practical learning path

A broad, hands-on introduction to database systems. The learning track is deliberately kept separate from the existing Django/HospitalSystem project so it can be studied without changing or relying on that application.

## What you will learn

- What databases and database management systems do
- Relational and non-relational data models and when to consider each
- Tables, rows, columns, keys, constraints, and relationships
- SQL: creating, reading, updating, and deleting data (CRUD)
- Filtering, sorting, aggregation, joins, subqueries, and common table expressions
- Data modeling, ER diagrams, and normalization
- Transactions, ACID properties, and concurrency concepts
- Indexes, query plans, and the trade-off between read speed and write/storage cost
- Views, schema changes, migrations, and data integrity
- Application security: parameterized queries, least privilege, and safe handling of secrets
- Backups, restore testing, and operational basics
- Introductory comparison of SQLite, PostgreSQL, MySQL, document databases, and key-value stores

This is a guided foundation, not a claim to cover every database product or advanced administration topic. The core lab uses SQLite because it is easy to run locally; the concepts transfer, but SQL syntax and operational features can differ between database engines.

## Quick start: run the SQL lab

Install SQLite and make a fresh working database from the repository root:

```bash
mkdir -p /tmp/database-basics-lab
sqlite3 /tmp/database-basics-lab/study.db < learning/sql/00_schema_and_seed.sql
sqlite3 /tmp/database-basics-lab/study.db < learning/sql/01_select_filter_sort.sql
sqlite3 /tmp/database-basics-lab/study.db < learning/sql/02_aggregates_and_joins.sql
sqlite3 /tmp/database-basics-lab/study.db < learning/sql/03_subqueries_and_ctes.sql
sqlite3 /tmp/database-basics-lab/study.db < learning/sql/04_transactions.sql
sqlite3 /tmp/database-basics-lab/study.db < learning/sql/05_indexes_and_query_plans.sql
sqlite3 /tmp/database-basics-lab/study.db < learning/sql/06_views.sql
```

The schema file creates the lab tables and sample rows. Run it against a **new disposable lab database**; do not point it at a database containing data you care about. Later lessons use that same database, so run the schema first. The SQL files include comments explaining what to observe.

You can also open an interactive session with `sqlite3 /tmp/database-basics-lab/study.db` and paste queries from the lessons.

## Course map

1. [`learning/01_database_concepts.md`](learning/01_database_concepts.md) — database types and essential vocabulary
2. [`learning/02_modeling_and_normalization.md`](learning/02_modeling_and_normalization.md) — relationships, ER thinking, and normalization
3. [`learning/sql/00_schema_and_seed.sql`](learning/sql/00_schema_and_seed.sql) — create a small relational schema with keys and constraints
4. [`learning/sql/01_select_filter_sort.sql`](learning/sql/01_select_filter_sort.sql) — select, filter, sort, and limit
5. [`learning/sql/02_aggregates_and_joins.sql`](learning/sql/02_aggregates_and_joins.sql) — grouping, aggregates, inner joins, and left joins
6. [`learning/sql/03_subqueries_and_ctes.sql`](learning/sql/03_subqueries_and_ctes.sql) — nested queries and CTEs
7. [`learning/sql/04_transactions.sql`](learning/sql/04_transactions.sql) — commit, rollback, and savepoints
8. [`learning/sql/05_indexes_and_query_plans.sql`](learning/sql/05_indexes_and_query_plans.sql) — indexes and `EXPLAIN QUERY PLAN`
9. [`learning/sql/06_views.sql`](learning/sql/06_views.sql) — reusable views
10. [`learning/03_safety_and_operations.md`](learning/03_safety_and_operations.md) — query safety, backups, migrations, and operations
11. [`learning/exercises.md`](learning/exercises.md) — practice tasks and a capstone project

## Recommended study routine

For each lab, read the SQL comments, run the file, inspect the output, then change one query and predict its result. Try the exercises before looking at their hints. Keep experiments in the disposable lab database, and rebuild it when you want a clean start.

## Existing project

The repository also contains a Django hospital-system project and older project artifacts. Those are separate from the new learning track. Use the existing project's own setup instructions and a safe local database; do not assume the SQL lab schema applies to that application.

## Further reading

- [SQLite documentation](https://www.sqlite.org/docs.html)
- [PostgreSQL tutorial](https://www.postgresql.org/docs/current/tutorial.html)
- [MySQL documentation](https://dev.mysql.com/doc/)
- [OWASP SQL Injection Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html)

## Contribution standard

Contributions should teach a concrete concept, include runnable examples where practical, explain assumptions and engine differences, and avoid committing credentials, private data, generated databases, or virtual environments.
