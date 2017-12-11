--Add values to Foo
insert into LabB.Foo (a, b) values (3, 3);
insert into LabB.ExtraValue values (3, (SELECT MAX(id_extendable)
  FROM LabB.Extendable), 0);
insert into LabB.Foo (a, b) values (4, 4);
  insert into LabB.ExtraValue values (4, (SELECT MAX(id_extendable)
    FROM LabB.Extendable), 0);

--Create view of NewFoo
CREATE OR REPLACE VIEW NewFoo as
select a, b, value::integer as c
from LabB.Foo inner join LabB.ExtraValue
on LabB.Foo.id_extendable = LabB.ExtraValue.fk_Extendableid_Extendable;
