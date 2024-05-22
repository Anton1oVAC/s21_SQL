DROP  VIEW v_generated_dates;
DROP  VIEW v_person_female;
DROP  VIEW v_persons_male;
DROP  VIEW v_persons_female;
DROP  VIEW v_price_with_discount;
DROP  VIEW v_symmetric_union;
DROP MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

select count(*) =0 as check from pg_class where relname in ('v_generated_dates','v_persons_female','v_persons_male', 'v_price_with_discount','v_symmetric_union', 'mv_dmitriy_visits_and_eats')