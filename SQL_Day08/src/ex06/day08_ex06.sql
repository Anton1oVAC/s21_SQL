--One session
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT SUM(rating) FROM pizzeria;

SELECT SUM(rating) FROM pizzeria;
COMMIT;

SELECT SUM(rating) FROM pizzeria;

--Two session
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';
COMMIT;

SELECT SUM(rating) FROM pizzeria;