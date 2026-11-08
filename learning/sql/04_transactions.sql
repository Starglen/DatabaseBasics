-- Lesson: transactions and savepoints.
-- Requires the database created by 00_schema_and_seed.sql.
-- Run this file through sqlite3. The first update is rolled back; the second commits.

SELECT member_id, name FROM members WHERE member_id = 3;

BEGIN;
UPDATE members SET name = 'Temporary name' WHERE member_id = 3;
SELECT member_id, name FROM members WHERE member_id = 3;
ROLLBACK;

-- After ROLLBACK, the original name is restored.
SELECT member_id, name FROM members WHERE member_id = 3;

BEGIN;
SAVEPOINT before_email_change;
UPDATE members SET email = 'jordan.updated@example.test' WHERE member_id = 2;
-- ROLLBACK TO would undo work since the savepoint without ending the transaction.
RELEASE before_email_change;
COMMIT;

SELECT member_id, email FROM members WHERE member_id = 2;

-- A transaction groups related changes. If a later operation fails, roll back
-- instead of leaving partially applied work. Transaction syntax and behavior
-- details vary across database engines.
