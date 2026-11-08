-- Lesson: aggregate functions and joins.
-- Requires the database created by 00_schema_and_seed.sql.

-- COUNT, AVG, and SUM summarize a set of rows.
SELECT COUNT(*) AS book_count,
       ROUND(AVG(price), 2) AS average_price,
       ROUND(SUM(price), 2) AS total_list_price
FROM books;

-- INNER JOIN returns matching author/book pairs.
SELECT authors.name AS author, books.title
FROM authors
INNER JOIN books ON books.author_id = authors.author_id
ORDER BY author, books.title;

-- LEFT JOIN retains authors even when they have no books.
SELECT authors.name AS author, COUNT(books.book_id) AS book_count
FROM authors
LEFT JOIN books ON books.author_id = authors.author_id
GROUP BY authors.author_id, authors.name
ORDER BY book_count DESC, author;

-- HAVING filters groups after aggregation; WHERE filters rows before grouping.
SELECT authors.name AS author, COUNT(books.book_id) AS book_count
FROM authors
JOIN books ON books.author_id = authors.author_id
GROUP BY authors.author_id, authors.name
HAVING COUNT(books.book_id) > 1;

-- Try it: report each member and their number of loans, including members with none.
