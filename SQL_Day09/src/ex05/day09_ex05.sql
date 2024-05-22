DROP FUNCTION fnc_persons_female();
DROP FUNCTION fnc_persons_male();

CREATE OR REPLACE FUNCTION fnc_persons (IN pgender VARCHAR DEFAULT 'female')
RETURNS SETOF person AS $$
 SELECT * FROM person WHERE gender = pgender
$$ LANGUAGE SQL;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();
