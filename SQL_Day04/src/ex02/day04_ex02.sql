CREATE VIEW v_generated_dates AS
    SELECT date::date AS generated_date
        FROM generate_series('2022-01-01'::date, '2022-01-31'::date, '1 days') AS date
        ORDER BY generated_date;

select count(*) =31 as check, min(generated_date) as check1, max(generated_date) as check2 from v_generated_dates;