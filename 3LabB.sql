--Create extra column
insert into LabB.ExtraColumn values ('c', 'integer', 0);

--Populate ExtraValue
insert into LabB.ExtraValue(fk_Extendableid_Extendable,
  fk_ExtraColumnid_ExtraColumn)
(select * from LabB.Extendable, (values (0)) as v);
