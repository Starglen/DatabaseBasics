-- Lesson: SELECT, WHERE, ORDER BY, and LIMIT.
-- Requires the database created by 00_schema_and_seed.sql.

-- Choose specific columns rather than selecting everything.
SELECT title, published_year, price
FROM books
WHERE published_year >= 1990
ORDER BY published_year DESC, title ASC;

-- Combine conditions and use a range.
SELECT title, price
FROM books
WHERE price BETWEEN 12 AND 15
  AND published_year IS NOT NULL
ORDER BY price;

-- Pattern matching; LIKE behavior can depend on the DBMS and collation.
SELECT name
FROM authors
WHERE name LIKE '%Butler%';

-- LIMIT is useful for previews; without ORDER BY, row order is not guaranteed.
SELECT title
FROM books
ORDER BY title
LIMIT 3;

-- Try it: find books published before 1980 and order from oldest to newest.
