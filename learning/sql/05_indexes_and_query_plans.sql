-- Lesson: indexes and query plans.
-- Requires the database created by 00_schema_and_seed.sql.

-- Inspect a search plan before adding an index. The small sample may lead SQLite
-- to choose a scan; query planners make cost-based decisions from data and stats.
EXPLAIN QUERY PLAN
SELECT book_id, title FROM books WHERE author_id = 1;

-- An index can help searches by author_id. Foreign keys do not automatically
-- imply that every DBMS creates an index on the child column.
CREATE INDEX IF NOT EXISTS idx_books_author_id ON books(author_id);

EXPLAIN QUERY PLAN
SELECT book_id, title FROM books WHERE author_id = 1;

-- Indexes use disk and add work to inserts, updates, and deletes. Add them for
-- measured query patterns, not every column. Unique constraints commonly need
-- an index to enforce uniqueness.

-- Try it: consider an index for finding active loans by member. What columns
-- would the query filter on? Compare the plan before and after an index.
