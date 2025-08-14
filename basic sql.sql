create database college
use college ;
create table student (
id int primary key,
name varchar(50),
age int not null
);
insert into student
(id ,name,age)
values
(101,"nishant",20),
(102,"karan",21),
(103,"nj",25),(104,"kar",5);
delete from student
where id = 104;
select * from student;
insert into student
(id ,name,age)
values
(104,"veer",25);
update student
set name = 'niraj' , age=20
where id = 103 ;
select distinct age from student;
select * from student where age >= 21;
alter table student
add column city varchar(25);
UPDATE student
SET city = 'New York'
WHERE id = 101;

UPDATE student
SET city = 'Los Angeles'
WHERE id = 102;

UPDATE student
SET city = 'Chicago'
WHERE id =103;

UPDATE student
SET city = 'Chicago'
WHERE id =104;
select


