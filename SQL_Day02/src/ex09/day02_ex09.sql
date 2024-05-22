SELECT person.name AS name
FROM person
JOIN person_order ON person.id = person_order.person_id
JOIN menu ON person_order.menu_id = menu.id
WHERE person.gender = 'female'
  AND menu.pizza_name = 'cheese pizza'
  AND EXISTS (
    SELECT 1
    FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
    WHERE person_order.person_id = person.id
      AND menu.pizza_name = 'pepperoni pizza'
  )
ORDER BY name;