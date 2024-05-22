SELECT person.name AS name
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN person ON person_order.person_id = person.id
WHERE (person.address = 'Moscow' OR person.address = 'Samara') AND (person.gender = 'male')
    AND (menu.pizza_name = 'pepperoni pizza' OR menu.pizza_name = 'mushroom pizza')
ORDER BY name DESC;