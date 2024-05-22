SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT menu.pizza_name AS pizza_name,
       pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria On menu.pizzeria_id = pizzeria.id


set enable_seqscan =off;
      explain analyse
      select
          m.pizza_name as pizza_name,
          pz.name as pizzeria_name
      from  menu m
      inner join pizzeria pz on m.pizzeria_id = pz.id;