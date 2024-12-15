-- database
create database joes;
drop database joes;
create database tutorjoes;
show databases;
use tutorjoes;

-- create table 
create table users(
	id int not null auto_increment,
    name varchar(50) not null,
    age int not null,
    primary key(id)
);

show tables;
describe users;

-- alter command
alter table users add gender varchar(10) not null after age;
alter table users
	add city varchar(10) not null,
    add contact varchar(50) not null;
    
-- modify
alter table users modify contact varchar(25) not null;
-- renaming table
alter table users rename to students;

-- inserting methods
insert into students values (null,'Ram',25,'Male','Salem','8922983787');
insert into students (name,age,gender,city,contact) values ('Sam',23,'Male','Namakkal','8364359872');
insert into students (name,age,gender,city,contact) values
	('Ravi',23,'Male','Namakkal','8364359872'),
    ('Sara',23,'Female','Namakkal','8364359872');

-- delete command
delete from students where id=4;

-- update command
update students set city="Hosur", contact="8736647323" where id=3;

-- truncate command
truncate table students;

insert into students (name,age,gender,contact,city) values
('Ram',25,'Male','9786237654','Salem'),
('Sam',23,'Male','9856712348','Namakkal'),
('Aswani',23,'Female','9845698767','Chennai'),
('Radha',21,'Female','8796778976','Namakkal'),
('Sunddar',23,'Male','9845321234','Hosur'),
('Kalai',24,'Female','9867567898','Dharmapuri'),
('Kumar',29,'Male','9987886543','Hosur'),
('Rajeshwari',23,'Female','9854345676','Namakkal'),
('Haja',22,'Male','9876787656','Chennai'),
('Lakshmi',21,'Female','9999876756','Chennai'),
('Guru',28,'Male','9123237867','Hosur'),
('Lakshman',22,'Male','9856781234','Namakkal'),
('Rahul',12,'Male','9867567123','Namakkal'),
('Mala',15,'Female','8786457645','Dharmapuri'),
('Yokesh',16,'Male','8888769324','Hosur'),
('Uma',17,'Female','9878554454','Chennai'),
('Magesh',18,'Male','9866654565','Hosur'),
('Malathi',21,'Female','9786111234','Namakkal'),
('Ramya',22,'Female','9876788756','Dharmapuri'),
('Rajesh',23,'Male','9786238883','Chennai'),
('Karthika',22,'Female','9823456666','Dharmapuri'),
('Sankar',25,'Male','8887654567','Namakkal');

-- displaying records
select * from students;

select name,age from students;
select name,age,city from students where city="namakkal";
select name,age,city from students where city="chennai";
-- using and, or
select name,age,city from students where city="hosur" and age>=23;
select name,age,city from students where city="namakkal" or city="hosur";
select name,age,city from students where (city="namakkal" or city="hosur") and age>=23;
-- order by
select name,age,city from students where (city="namakkal" or city="hosur") and age>=23 order by city;

select city from students;
-- distinct
select distinct city from students;
-- count
select count(city) from students;
select count(distinct city) from students;
-- as (Alias)
select count(distinct city) as City_Count from students;
-- limit
select * from students limit 0,10; -- starting value + 1 , how many records to show
select * from students limit 10,10; -- 11 to 20 record
select * from students limit 15,5; -- 16 to 20 record
select * from students order by id desc limit 0,1; -- last record

-- aggregate functions
select max(age) from students;
select min(age) from students;
select avg(age) from students;
select round(avg(age),0) from students;
select sum(age) from students;

-- gender count report
select gender,count(id) from students; -- error
select gender,count(id) as Total from students group by gender;

-- city student count report
select city,count(id) as Total from students group by city;

-- wildcard queries
select name from students;
select name from students where name like 'ra%';
select name from students where name like '%am';
select name from students where name like '%la%';

select name from students where name not like '%a%';

-- in, not in command
select * from students where city="salem" or city="namakkal";
select * from students where city in('salem','namakkal');
select * from students where city not in('salem','namakkal');
-- between 
select name,age from students where age between 24 and 30;
select name,age from students where age not between 24 and 30;

-- ----------------------------------------------------------------------------------------------

-- Attendance Table:
create table attendance(
	aid int not null auto_increment,
    id int not null,
    adate date not null,
    astatus varchar(10) not null,
    primary key(aid)
);

show tables;

insert into attendance (id,adate,astatus) values
(1,'2018-11-01','P'),
(1,'2018-11-02','P'),
(1,'2018-11-03','P'),
(1,'2018-11-04','P'),
(2,'2018-11-01','P'),
(2,'2018-11-02','A'),
(2,'2018-11-03','A'),
(2,'2018-11-04','P'),
(3,'2018-11-01','A'),
(3,'2018-11-02','A'),
(3,'2018-11-03','A'),
(3,'2018-11-04','A'),
(4,'2018-11-01','A'),
(4,'2018-11-02','A'),
(4,'2018-11-03','P'),
(4,'2018-11-04','P'),
(5,'2018-11-01','P'),
(5,'2018-11-02','P'),
(5,'2018-11-03','P'),
(5,'2018-11-04','P'),
(6,'2018-11-01','P'),
(6,'2018-11-02','P'),
(6,'2018-11-03','P'),
(6,'2018-11-04','P'),
(7,'2018-11-01','P'),
(7,'2018-11-02','P'),
(7,'2018-11-03','P'),
(7,'2018-11-04','P'),
(8,'2018-11-01','P'),
(8,'2018-11-02','P'),
(8,'2018-11-03','P'),
(8,'2018-11-04','P'),
(9,'2018-11-01','P'),
(9,'2018-11-02','P'),
(9,'2018-11-03','P'),
(9,'2018-11-04','P'),
(10,'2018-11-01','P'),
(10,'2018-11-02','P'),
(10,'2018-11-03','P'),
(10,'2018-11-04','P'),
(11,'2018-11-01','A'),
(11,'2018-11-02','A'),
(11,'2018-11-03','P'),
(11,'2018-11-04','P'),
(12,'2018-11-01','A'),
(12,'2018-11-02','A'),
(12,'2018-11-03','A'),
(12,'2018-11-04','P'),
(13,'2018-11-01','P'),
(13,'2018-11-02','A'),
(13,'2018-11-03','A'),
(13,'2018-11-04','P'),
(14,'2018-11-01','P'),
(14,'2018-11-02','A'),
(14,'2018-11-03','A'),
(14,'2018-11-04','P'),
(15,'2018-11-01','P'),
(15,'2018-11-02','P'),
(15,'2018-11-03','P'),
(15,'2018-11-04','P'),
(16,'2018-11-01','P'),
(16,'2018-11-02','P'),
(16,'2018-11-03','P'),
(16,'2018-11-04','P'),
(17,'2018-11-01','P'),
(17,'2018-11-02','P'),
(17,'2018-11-03','P'),
(17,'2018-11-04','P'),
(18,'2018-11-01','P'),
(18,'2018-11-02','P'),
(18,'2018-11-03','P'),
(18,'2018-11-04','P'),
(19,'2018-11-01','P'),
(19,'2018-11-02','A'),
(19,'2018-11-03','P'),
(19,'2018-11-04','P'),
(20,'2018-11-01','P'),
(20,'2018-11-02','P'),
(20,'2018-11-03','P'),
(20,'2018-11-04','P'),
(21,'2018-11-01','P'),
(21,'2018-11-02','P'),
(21,'2018-11-03','P'),
(21,'2018-11-04','P'),
(22,'2018-11-01','P'),
(22,'2018-11-02','P'),
(22,'2018-11-03','A'),
(22,'2018-11-04','P');

select * from students; -- student info
select * from attendance; -- attendance info
select * from attendance where id=1; -- ram attendance record

select id,count(adate) as working from attendance group by id;

select id, count(adate) as working,
count(if(astatus='P',1,null)) as present
from attendance group by id;

select * from attendance where id=3;

-- ----------------------------------------------------------------------------------------------

-- join query

select * from students;
select * from attendance;

select students.name, attendance.adate, attendance.astatus from students inner join attendance on students.id=attendance.id;

-- ----------------------------------------------------------------------------------------------

-- bus fare
/*
salem=100
namakkal=150
chennai=300
hosur=350
dharmapuri=450
*/

select name,city,
(
	case
		when city='salem' then 100
        when city='namakkal' then 150
        when city='chennai' then 300
        when city='hosur' then 350
        when city='Dharmapuri' then 450
        else 0
	end
)
as amount from students;

