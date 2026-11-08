# Practice exercises and capstone

Use the SQLite library lab created by `sql/00_schema_and_seed.sql`. Try each task before consulting the hints. Save your solutions in a separate file so the lesson examples remain unchanged.

## SQL practice

1. List all books, newest publication year first, with unknown years last.
2. Find every member who has an active loan and show the book title.
3. Count books per author, including authors who have no books.
4. Calculate the number of active loans per member, including members with zero active loans.
5. Find books priced above the average price.
6. Use a CTE to list books that have never been loaned.
7. Return the three most expensive books.
8. Create a view that reports each book and its author.

## Modeling practice

Design a schema for an event-booking service with users, events, and registrations. A user can register for many events, and an event can have many users. Decide where registration time and registration status belong. Add keys, foreign keys, uniqueness, and sensible checks.

## Concepts to explain in your own words

- Why use a foreign key instead of storing an author name in every book row?
- What is the difference between `WHERE` and `HAVING`?
- What does a transaction protect you from?
- Why can adding an index make writes slower?
- Why should an application use parameterized queries for user-supplied values?
- When might a document database be a reasonable option? What trade-offs should be considered?

## Capstone: library checkout tracker

Extend the sample schema in a separate lab database:

- Add a due date to loans.
- Prevent a book from having two active loans at the same time (research the best constraint or transaction approach for your chosen DBMS).
- Add a query for overdue books.
- Build a member loan-history report.
- Add an index only after identifying a query it should help.
- Document how you would back up and restore this database.

## Hints

Use `LEFT JOIN` when results must include rows with no match; count a nullable joined key rather than `COUNT(*)`. Use `NOT EXISTS` for a clear “no matching row” question. Use `EXPLAIN QUERY PLAN` to inspect SQLite's plan, but do not assume a tiny sample demonstrates production performance.
