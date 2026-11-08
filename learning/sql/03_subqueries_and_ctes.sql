-- Lesson: subqueries and common table expressions (CTEs).
-- Requires the database created by 00_schema_and_seed.sql.

-- A scalar subquery compares each book against the overall average price.
SELECT title, price
FROM books
WHERE price > (SELECT AVG(price) FROM books)
ORDER BY price DESC;

-- A CTE gives a name to an intermediate result and can improve readability.
WITH active_loans AS (
    SELECT book_id, member_id, borrowed_on
    FROM loans
    WHERE returned_on IS NULL
)
SELECT members.name AS member,
       books.title AS book,
       active_loans.borrowed_on
FROM active_loans
JOIN members ON members.member_id = active_loans.member_id
JOIN books ON books.book_id = active_loans.book_id
ORDER BY active_loans.borrowed_on;

-- NOT EXISTS finds authors who do not currently have an active loaned book.
SELECT authors.name
FROM authors
WHERE NOT EXISTS (
    SELECT 1
    FROM books
    JOIN loans ON loans.book_id = books.book_id
    WHERE books.author_id = authors.author_id
      AND loans.returned_on IS NULL
);

-- Try it: use a CTE to list books that have never been loaned.
