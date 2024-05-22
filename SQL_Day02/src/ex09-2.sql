SELECT person.name AS name
FROM person
JOIN person_order po1 ON person.id = po1.person_id
JOIN menu m1 ON po1.menu_id = m1.id
JOIN person_order po2 ON person.id = po2.person_id
JOIN menu m2 ON po2.menu_id = m2.id
WHERE person.gender = 'female'
  AND m1.pizza_name = 'pepperoni pizza'
  AND m2.pizza_name = 'cheese pizza'
ORDER BY name;


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


WITH
    cte_p_pizza(pepperoni) AS (
    (SELECT person.name AS pepperoni
    FROM person_order
    INNER JOIN person ON person_order.person_id = person.id
    INNER JOIN menu ON menu.id = person_order.menu_id
    WHERE person.gender = 'female' AND pizza_name = 'pepperoni pizza')
),
    cte_ch_pizza(cheese) AS (
    (SELECT person.name AS cheese
    FROM person_order
    INNER JOIN person ON person_order.person_id = person.id
    INNER JOIN menu ON menu.id = person_order.menu_id
    WHERE person.gender = 'female' AND pizza_name = 'cheese pizza')
)
SELECT person.name FROM person
   INNER JOIN cte_p_pizza ON cte_p_pizza.pepperoni = person.name
   INNER JOIN cte_ch_pizza ON cte_ch_pizza.cheese = person.name


Сравнивая предложенные запросы, можно сделать несколько наблюдений о том, \
как они решают задачу выборки имен женщин, которые заказывали как пиццу "pepperoni pizza", \
так и "cheese pizza". Все три запроса пытаются достичь одной и той же цели, но делают это разными способами.

Первый запрос использует два соединения JOIN для таблицы person_order и menu, \
чтобы найти женщин, заказывавших обе пиццы. Этот подход может быть неэффективным, \
если в таблице person_order много записей для одной и той же пиццы, \
так как каждое соединение будет выполняться для каждой строки в person_order.

Второй запрос использует подзапрос EXISTS для проверки наличия заказа "pepperoni pizza" \
для каждой женщины, которая также заказала "cheese pizza". \
Этот подход более эффективен, поскольку он не требует дополнительных соединений для каждой пиццы, \
а только проверяет наличие заказа "pepperoni pizza" для каждой женщины, \
которая уже была найдена как заказчица "cheese pizza".

Третий запрос использует общие табличные выражения (CTE) для создания двух временных таблиц: \
одной для женщин, заказывавших "pepperoni pizza", и другой для женщин, заказывавших "cheese pizza". \
Затем он соединяет эти CTE с основной таблицей person, чтобы найти женщин, которые появились в обеих таблицах. \
Этот подход может быть более читаемым и модульным, особенно если вам нужно использовать результаты CTE \
в других частях запроса или если вы хотите разделить логику запроса на более мелкие, управляемые части.