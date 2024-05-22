SELECT
    person.name AS name,
    menu.pizza_name AS pizza_name,
    menu.price AS price,
    price - price * person_discounts.discount * 0.01 AS sale,
    pizzeria.name AS pizzeria_name
FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
JOIN person_discounts ON person_order.person_id = person_discounts.person_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY name, pizza_name;