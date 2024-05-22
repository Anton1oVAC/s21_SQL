--One session
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
COMMIT;

--Two session
BEGIN;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

