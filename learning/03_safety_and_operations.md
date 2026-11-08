# Safe queries, migrations, and operations

## Parameterized queries

Never build SQL by concatenating untrusted user input. Use your database library's parameter binding, for example Python's `sqlite3`:

```python
import sqlite3

connection = sqlite3.connect("study.db")
rows = connection.execute(
    "SELECT book_id, title FROM books WHERE title = ?",
    (user_supplied_title,),
).fetchall()
```

The placeholder syntax is driver-specific. Parameters are for values, not table or column names; if dynamic identifiers are needed, validate them against a strict allow-list. Parameterization prevents values from changing the intended SQL structure; it does not replace authorization or validation.

## Migrations

Treat schema changes as reviewed, versioned changes. A migration should be repeatable in a controlled deployment process, have a rollback or recovery plan where possible, and be tested against a copy of representative data. Back up important data before risky changes. Do not edit a production database by hand without a recorded plan.

## Backups and recovery

A backup is useful only if it can be restored. Choose a backup method appropriate to the DBMS, consistency requirements, database size, and recovery objectives. Protect backup files like the original data, restrict access, encrypt where appropriate, and periodically test a restore in a safe environment.

## Access and secrets

- Give applications only the database permissions they need.
- Do not commit credentials, tokens, or real personal/medical data.
- Keep secrets out of source code and use the deployment environment's secret management.
- Avoid using sensitive data in sample databases or logs.
- Use TLS and product-recommended security settings for networked databases.

## Performance basics

Start by identifying the slow query and measuring it. Inspect the query plan, data size, filters, joins, and indexes. An index can speed reads but consumes space and adds work to writes. Avoid claiming performance improvement based only on tiny sample data.

## Engine differences

SQL is widely shared, but data types, date operations, auto-generated keys, transaction behavior, JSON support, index options, migration tooling, and administration differ. Check the documentation for your exact engine and version before using a feature outside the SQLite lab.
