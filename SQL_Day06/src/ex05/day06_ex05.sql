COMMENT ON TABLE person_discounts
    IS 'This table stores information about discounts for individuals at various pizzerias.';
COMMENT ON COLUMN person_discounts.person_id
    IS 'The ID of the person who receives the discount.';
COMMENT ON COLUMN person_discounts.pizzeria_id
    IS 'The ID of the pizzeria where the discount is applicable.';
COMMENT ON COLUMN  person_discounts.discount
    IS 'The percentage discount applied to the person at the pizzeria.';