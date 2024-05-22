CREATE TABLE person_audit (
    created timestamp with time zone not null default current_timestamp,
    type_event char(1) not null default 'I',
    row_id bigint not null,
    name varchar,
    age integer,
    gender varchar,
    address varchar,
    constraint ch_type_event check (type_event in('I', 'D', 'U'))
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
    VALUES ('I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Dimar', 22, 'male', 'Irkutsk');