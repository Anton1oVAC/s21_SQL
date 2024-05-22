    (SELECT pizzeria.name, COUNT(*), 'посещение' AS action_type
    FROM person_visits
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
    LIMIT 3)
UNION
    (SELECT pizzeria.name, COUNT(*), 'заказ' AS action_type
    FROM person_order
    JOIN menu ON menu.id = person_order.menu_id
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    GROUP BY pizzeria.name
    LIMIT 3)
ORDER BY action_type, count DESC;
