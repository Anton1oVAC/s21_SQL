CREATE SEQUENCE seq_person_discounts START 1;

ALTER TABLE person_discounts ALTER COLUMN id SET DEFAULT NEXTVAL('seq_person_discounts');

SELECT SETVAL('seq_person_discounts', (SELECT MAX(id) FROM person_discounts) + 1);