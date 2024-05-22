CREATE VIEW v_persons_male
    AS SELECT * FROM person WHERE gender = 'male';

CREATE VIEW v_persons_female
    AS SELECT * FROM person WHERE gender = 'female';

select * from v_persons_female order by 1

select * from v_persons_male order by 1