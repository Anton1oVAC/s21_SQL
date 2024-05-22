SELECT
    (SELECT name FROM person WHERE id = person_order.person_id) AS name_person,
    (SELECT pizza_name FROM menu WHERE id = person_order.menu_id) AS pizza_name,
    (SELECT name FROM pizzeria WHERE id = name.pizzeria_id) AS pizzeria
FROM person_order
JOIN menu name ON person_order.menu_id = name.id
JOIN person ON person.id = person_order.person_id
ORDER BY name_person, pizza_name, pizzeria;

