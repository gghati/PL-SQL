
-- Assertion
CREATE ASSERTION StrepAge CHECK
(NOT EXISTS 
(SELECT *
FROM Patient, Diagnosis
WHERE Patient.name = Diagnosis.pname AND Diagnosis.disease  =’Strep’ AND Patient.age >= 60));



-- Object relational database system

-- user defined datatype
create type Person
    (ID varchar(20) primary key,
     name varchar(20),
     address varchar(20))  										    
ref from(ID);

-- table based on the structured data type:
create table people_table of Person;

-- Table types
 create type interest as table (
     topic varchar(20),
     degree_of_interest int
);

-- We can use such types for attributes in relations/  user-defined types 
create table users (ID varchar(20),
     name varchar(20),
     interests interest
); 

-- Type inheritance
create type Student under Person
(degree varchar(20));
create type Teacher under Person
(salary integer);

-- Table inheritance syntax
create table students_table
    (degree varchar(20))
    inherits people_table;
create table teachers_table
    (salary integer)
    inherits people_table; 

-- 
create table people_table of Person;
	create table students_table of Student
   	 under people_table;
	create table teachers_table of Teacher
    	under people_table; 



-- create reference types
create type Person
    (ID varchar(20) primary key,
     name varchar(20),
     address varchar(20))
     ref from(ID);
create table people of Person; 

create type Department (
     dept_name varchar(20),
     head ref(Person) scope people);
create table departments of Department 
insert into departments values ('CS', '12345’) 


-- System generated references can be retrieved using subqueries
(select ref(p)   from people as p    where ID = '12345') 

