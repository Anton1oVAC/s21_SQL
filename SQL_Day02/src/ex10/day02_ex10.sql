SELECT person1.name AS name1,
       person2.name AS name2,
       person1.address AS address
FROM person AS person1
CROSS JOIN person AS person2
WHERE person1.name != person2.name AND person1.address = person2.address AND person1.id > person2.id
ORDER BY name1, name2, address;
