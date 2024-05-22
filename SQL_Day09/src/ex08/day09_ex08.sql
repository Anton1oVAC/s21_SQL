CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE(fibonacci_number BIGINT) AS $$
DECLARE
    a BIGINT := 0;
    b BIGINT := 1;
    temp BIGINT;
BEGIN
    FOR i IN 1..pstop LOOP
        fibonacci_number := a;
        temp := a + b;
        a := b;
        b := temp;
        RETURN NEXT;
    END LOOP;
END;
$$ LANGUAGE plpgsql;


select * from fnc_fibonacci(10);
select * from fnc_fibonacci();