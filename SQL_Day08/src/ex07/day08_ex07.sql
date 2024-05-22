--One session
SHOW TRANSACTION ISOLATION LEVEL;
BEGIN;
UPDATE pizzeria SET rating = 3.5 WHERE id = 1;

UPDATE pizzeria SET rating = 3.5 WHERE id = 2;
COMMIT;

--Two session
SHOW TRANSACTION ISOLATION LEVEL;
BEGIN;
UPDATE pizzeria SET rating = 3.5 WHERE id = 2;

UPDATE pizzeria SET rating = 3.5 WHERE id = 1;
COMMIT;