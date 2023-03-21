-- how to look all information schema of table
select * from information_schema.tables;

-- how to look all information coloumn of table
select * from information_schema.columns;

-- how to create table

create table affiliations (
    firstname text,
    lastname text,
    university_shortname text,
    function text,
    organisation text
);

-- how to rename column

alter table affiliations RENAME COLUMN organisation to organization;

-- how to drop column

alter table affiliations drop COLUMN function;

-- how to migrate table without redundancy data

insert into table_baru
select distinct nama_column,nama_column, ... 
from table_lama


-- how to casting data types in query

select column * CAST(column as integer) from table_name;

-- how to change data type in column

alter table table_name alter column nama_column TYPE new_data_type;

-- how to change data type in column with tranformation

alter table table_name alter column nama_column TYPE new_data_type USING tranformation_name(nama_column);

-- how to create table with not null constraint

create table students (
    ssn integer not null,
    lastname varchar(64) not null,
    home_phone integer,
    office_phone integer
);

-- how to set not null constraint 

alter table students
alter column home_phone
set not null;

-- how to drop not null constraint

alter table students
alter column home_phone
drop not null;

-- how to create table with unique constraints 

create table table_name(
    column_name unique
);

alter table table_name
add constraint constraint_name unique(column_name);

-- how to add primary key
alter table table_name
add constraint constraint_name primary key (some_column)

-- how to add surrogate key(combination unique of some column)
alter table table_name add column coloumn_c varchar(256);
update table_name set column_c = concat(column_a,column_b);
alter table table_name add constraint constraint_name primary key (column_c);

-- how to create table with foreign key (1 to 1)
CREATE TABLE Country
(
Pk_Country_Id INT IDENTITY PRIMARY KEY,
Name VARCHAR(100),
Officiallang VARCHAR(100),
Size INT(11),
);

CREATE TABLE UNrepresentative
(
Pk_UNrepresentative_Id INT PRIMARY KEY,
Name VARCHAR(100),
Gender VARCHAR(100),
Fk_Country_Id INT UNIQUE FOREIGN KEY REFERENCES Country(Pk_Country_Id)
);


-- how to add foreign key (1 to n or n to 1) 
alter table child_column
add constraint constraint_name foreign key (child_to_parent_attribute) references parent_column (parent_attribute);

-- how to create table with foreign key (m to m)
create table affiliations(
    professor_id integer references professos (id),
    organization_id varchar(256) references organization(id),
    function varchar(256)
)