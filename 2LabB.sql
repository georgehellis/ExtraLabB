--Creation of Trigger Function
CREATE FUNCTION update_extendable() RETURNS trigger AS $update_extendable$
  DECLARE max_id integer := (SELECT MAX(id_extendable) FROM LabB.Extendable);
  BEGIN
    IF max_id IS NOT NULL THEN
      INSERT INTO LabB.Extendable VALUES(max_id + 1);
      NEW.id_extendable := max_id + 1;
      RETURN NEW;
    END IF;
    INSERT INTO LabB.Extendable VALUES(0);
    NEW.id_extendable := 0;
    RETURN NEW;
	END;
  $update_extendable$ LANGUAGE plpgsql;

--Creation of Trigger
CREATE TRIGGER insert_extendable
BEFORE INSERT ON LabB.Foo
FOR EACH ROW EXECUTE PROCEDURE update_extendable();

--Insert of First Row:
insert into labb.foo (a, b) values (1, 1);

--Insert of Second Row:
insert into labb.foo (a, b) values (2, 2);
