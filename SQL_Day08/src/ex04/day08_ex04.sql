--One session
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--Two session
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';