CREATE VIEW v_price_with_discount AS
    SELECT person.name AS name,
           menu.pizza_name AS pizza_name,
           menu.price,
           CAST((price - price * 0.1) AS INTEGER) AS discount_price
    FROM person_order
    JOIN person ON person_order.person_id = person.id
    JOIN menu ON person_order.menu_id = menu.id
    ORDER BY name, pizza_name;

select * from v_price_with_discount
