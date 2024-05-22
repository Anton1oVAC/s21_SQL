SELECT menu.pizza_name, pizzeria.name, menu.price
FROM pizzeria
JOIN menu on pizzeria.id = menu.pizzeria_id
WHERE menu.pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY menu.pizza_name, pizzeria.name, menu.price;
