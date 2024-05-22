SELECT name, COUNT(*) AS count_of_order,
       ROUND(AVG(menu.price), 2) AS average_price,
       MAX(menu.price) AS max_price,
       MIN(menu.price) AS min_price
FROM pizzeria
JOIN menu ON pizzeria.id = menu.pizzeria_id
JOIN person_order ON menu.id = person_order.menu_id
GROUP BY pizzeria.name
ORDER BY name;