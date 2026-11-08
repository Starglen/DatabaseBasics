-- Lesson: views are named queries that can simplify repeated reads.
-- Requires the database created by 00_schema_and_seed.sql.

CREATE VIEW IF NOT EXISTS active_loan_details AS
SELECT loans.loan_id,
       members.name AS member_name,
       books.title AS book_title,
       loans.borrowed_on
FROM loans
JOIN members ON members.member_id = loans.member_id
JOIN books ON books.book_id = loans.book_id
WHERE loans.returned_on IS NULL;

SELECT member_name, book_title, borrowed_on
FROM active_loan_details
ORDER BY borrowed_on;

-- A regular view stores a query definition, not necessarily a saved result.
-- Materialized views and refresh behavior are DBMS-specific.
-- Views are not automatically a security boundary: check permissions and the
-- chosen DBMS behavior before relying on them for access control.
