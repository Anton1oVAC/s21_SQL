SELECT pizzeria.name, COALESCE(person_visits.count, 0) + COALESCE(person_order.count, 0) AS total_count
FROM (
  SELECT pizzeria_id, COUNT(*) AS count
  FROM person_visits
  GROUP BY pizzeria_id
) AS person_visits
FULL JOIN (
  SELECT menu.pizzeria_id, COUNT(*) AS count
  FROM person_order
  JOIN menu ON person_order.menu_id = menu.id
  GROUP BY menu.pizzeria_id
) AS person_order ON person_visits.pizzeria_id = person_order.pizzeria_id
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
ORDER BY total_count DESC, pizzeria.name;