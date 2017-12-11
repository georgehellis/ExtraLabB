--@(#) script.ddl

CREATE SCHEMA LabB;

CREATE TABLE LabB.Extendable
(
	id_Extendable integer,
	PRIMARY KEY(id_Extendable)
);

CREATE TABLE LabB.ExtraColumn
(
	name varchar (255),
	type varchar (255),
	id_ExtraColumn integer,
	PRIMARY KEY(id_ExtraColumn)
);

CREATE TABLE LabB.ExtraValue
(
	value varchar (255),
	fk_Extendableid_Extendable integer NOT NULL,
	fk_ExtraColumnid_ExtraColumn integer NOT NULL,
	PRIMARY KEY(fk_Extendableid_Extendable, fk_ExtraColumnid_ExtraColumn),
	CONSTRAINT PropertySets FOREIGN KEY(fk_Extendableid_Extendable)
		REFERENCES LabB.Extendable (id_Extendable),
	FOREIGN KEY(fk_ExtraColumnid_ExtraColumn)
		REFERENCES LabB.ExtraColumn (id_ExtraColumn)
);

CREATE TABLE LabB.Foo
(
	id_Extendable integer,
	a integer,
	b integer,
	PRIMARY KEY(id_Extendable),
	FOREIGN KEY(id_Extendable) REFERENCES LabB.Extendable (id_Extendable)
);
