-- Start with a NEW disposable SQLite database.
-- From the repository root:
-- sqlite3 /tmp/database-basics-lab/study.db < learning/sql/00_schema_and_seed.sql
-- This lesson creates a small library schema and sample data for later labs.

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS authors (
    author_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS books (
    book_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    published_year INTEGER CHECK (published_year BETWEEN 1400 AND 2100),
    price NUMERIC NOT NULL CHECK (price >= 0),
    isbn TEXT NOT NULL UNIQUE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE IF NOT EXISTS members (
    member_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS loans (
    loan_id INTEGER PRIMARY KEY,
    book_id INTEGER NOT NULL,
    member_id INTEGER NOT NULL,
    borrowed_on TEXT NOT NULL,
    returned_on TEXT,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    CHECK (returned_on IS NULL OR returned_on >= borrowed_on)
);

INSERT OR IGNORE INTO authors (author_id, name) VALUES
    (1, 'Ursula K. Le Guin'),
    (2, 'Octavia E. Butler'),
    (3, 'Terry Pratchett'),
    (4, 'N. K. Jemisin');

INSERT OR IGNORE INTO books (book_id, title, author_id, published_year, price, isbn) VALUES
    (1, 'A Wizard of Earthsea', 1, 1968, 12.50, '9780547773742'),
    (2, 'The Left Hand of Darkness', 1, 1969, 14.00, '9780441478125'),
    (3, 'Kindred', 2, 1979, 13.25, '9780807083697'),
    (4, 'Small Gods', 3, 1992, 11.75, '9780062237395'),
    (5, 'The Fifth Season', 4, 2015, 15.50, '9780316229296');

INSERT OR IGNORE INTO members (member_id, name, email) VALUES
    (1, 'Alex Rivera', 'alex@example.test'),
    (2, 'Jordan Lee', 'jordan@example.test'),
    (3, 'Morgan Chen', 'morgan@example.test');

INSERT OR IGNORE INTO loans (loan_id, book_id, member_id, borrowed_on, returned_on) VALUES
    (1, 1, 1, '2026-01-03', '2026-01-18'),
    (2, 3, 1, '2026-02-02', NULL),
    (3, 4, 2, '2026-02-10', NULL),
    (4, 2, 3, '2026-02-12', '2026-02-20');

-- Inspect the schema and sample data:
SELECT name, type FROM sqlite_master
WHERE type IN ('table', 'index')
ORDER BY type, name;

SELECT book_id, title, published_year FROM books ORDER BY book_id;
