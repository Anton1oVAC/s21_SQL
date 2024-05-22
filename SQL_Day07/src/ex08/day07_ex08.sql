SELECT person.address,
       pizzeria.name,
       COUNT(*)
FROM person_order
JOIN menu ON menu.id = person_order.menu_id
JOIN person ON person.id = person_order.person_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY person.address, pizzeria.name
ORDER BY address, name;