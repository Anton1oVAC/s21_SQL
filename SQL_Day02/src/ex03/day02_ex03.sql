WITH missing_dates AS (
    SELECT missing_date::date
    FROM generate_series('2022-01-01'::date, '2022-01-10', '1 day') AS missing_date
    LEFT JOIN (
        SELECT *
        FROM person_visits
        WHERE (person_visits.person_id = '1' OR person_visits.person_id = '2')
            AND (person_visits.visit_date BETWEEN '2022-01-01' AND '2022-01-10')
    ) new_table ON (missing_date=new_table.visit_date)
    WHERE visit_date IS NULL
)
SELECT missing_date
FROM missing_dates
ORDER BY missing_date
