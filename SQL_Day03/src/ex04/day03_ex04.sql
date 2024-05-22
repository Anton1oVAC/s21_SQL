(SELECT pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
JOIN person_order ON person_order.menu_id = menu.id
JOIN person ON person_order.person_id = person.id
WHERE person.gender = 'female'

EXCEPT

SELECT pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
JOIN person_order ON person_order.menu_id = menu.id
JOIN person ON person_order.person_id = person.id
WHERE person.gender = 'male')

UNION

(SELECT pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
JOIN person_order ON person_order.menu_id = menu.id
JOIN person ON person_order.person_id = person.id
WHERE person.gender = 'male'

EXCEPT

SELECT pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
JOIN person_order ON person_order.menu_id = menu.id
JOIN person ON person_order.person_id = person.id
WHERE person.gender = 'female')
ORDER BY pizzeria_name;