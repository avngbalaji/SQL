-- course table

create table course(
	cid int not null auto_increment,
    cname varchar(25) not null,
    primary key(cid)
);

insert into course (cname) values ('BCA'),('MCA'),('MBA');

select * from course;

-- marks table

create table marks(
	mid int not null auto_increment,
    id int not null,
    m1 int not null,
    m2 int not null,
    m3 int not null,
    primary key(mid)
);

insert into marks (id,m1,m2,m3) values (1,60,85,100),
(2,21,29,94),(3,100,87,18),(4,95,52,64),(5,45,56,72),(6,25,23,95),(7,100,25,57),(8,41,51,92),
(9,83,76,87),(10,80,89,48),(11,45,92,34),(12,35,56,22),(13,95,43,85),(14,90,55,77),(15,31,41,92),
(16,100,89,94),(17,80,47,78),(18,90,82,44),(19,66,86,42),(20,67,83,45),(21,88,29,97),(22,41,31,82);

select * from marks;

-- update students table

alter table students add comm varchar(20) not null, add cid int not null, add rollno varchar(20) not null;
select * from students;
truncate table students;
INSERT INTO students (name, age, gender, contact, city, comm, cid, rollno) 
VALUES
('Ram', 25, 'Male', '9786237654', 'Salem', 'SC', 1, 'A1001'),
('Sam', 23, 'Male', '9856712348', 'Namakkal', 'MBC', 1, 'A1002'),
('Aswani', 23, 'Female', '9845698767', 'Chennai', 'MBC', 1, 'A1003'),
('Radha', 21, 'Female', '8796778976', 'Namakkal', 'MBC', 1, 'A1004'),
('Sunddar', 23, 'Male', '9845321234', 'Hosur', 'SC', 1, 'A1005'),
('Kalai', 24, 'Female', '9867567898', 'Dharmapuri', 'MBC', 1, 'A1006'),
('Kumar', 29, 'Male', '9987886543', 'Hosur', 'SC', 2, 'B1001'),
('Rajeshwari', 23, 'Female', '9854345676', 'Namakkal', 'BC', 2, 'B1002'),
('Haja', 22, 'Male', '9876787656', 'Chennai', 'BC', 2, 'B1003'),
('Lakshmi', 21, 'Female', '9999876756', 'Chennai', 'BC', 2, 'B1004'),
('Guru', 28, 'Male', '9123237867', 'Hosur', 'MBC', 2, 'B1005'),
('Lakshman', 22, 'Male', '9856781234', 'Namakkal', 'BC', 2, 'B1006'),
('Rahul', 12, 'Male', '9867567123', 'Namakkal', 'FC', 2, 'B1007'),
('Mala', 15, 'Female', '8786457645', 'Dharmapuri', 'BC', 2, 'B1008'),
('Yokesh', 16, 'Male', '8888769324', 'Hosur', 'MBC', 3, 'C1001'),
('Uma', 17, 'Female', '9878554454', 'Chennai', 'BC', 3, 'C1002'),
('Magesh', 18, 'Male', '9866654565', 'Hosur', 'BC', 3, 'C1003'),
('Malathi', 21, 'Female', '9786111234', 'Namakkal', 'BC', 3, 'C1004'),
('Ramya', 22, 'Female', '9876788756', 'Dharmapuri', 'BC', 3, 'C1005'),
('Rajesh', 23, 'Male', '9786238883', 'Chennai', 'BC', 3, 'C1006'),
('Karthika', 22, 'Female', '9823456666', 'Dharmapuri', 'BC', 3, 'C1007'),
('Sankar', 25, 'Male', '8887654567', 'Namakkal', 'SC', 3, 'C1008');
select * from students;

-- ----------------------------------------------------------------------------------------------

select * from students;
select * from course;
select * from marks;

select students.name, students.rollno, students.cid from students; -- simple select
select students.name, students.rollno, course.cname from students 
inner join course on students.cid=course.cid; -- single inner join
select students.name, students.rollno, course.cname, marks.m1, marks.m2, marks.m3 from students 
inner join course on students.cid=course.cid 
inner join marks on students.id=marks.id; -- multiple inner join

/*
Total
Average
Result : above 35 pass
Grade :
	No grade for fail
    90 - 100 -> A
    80 - 89  -> B
    else     -> C
*/
-- answer for the above qn 
select students.NAME,students.ROLLNO,course.cname as COURSE,marks.M1,marks.M2,marks.M3,
(marks.m1+marks.m2+marks.m3) as TOTAL, (round((marks.m1+marks.m2+marks.m3)/3,2)) as AVERAGE,
case
	when marks.m1>=35 and marks.m2>=35 and marks.m3>=35 then 'PASS'
    else 'FAIL'
end as RESULT,
case
	when marks.m1>=35 and marks.m2>=35 and marks.m3>=35 then
		case
			when round((marks.m1+marks.m2+marks.m3)/3,2)>=90 and round((marks.m1+marks.m2+marks.m3)/3,2)<=100 then 'A'
            when round((marks.m1+marks.m2+marks.m3)/3,2)>=80 and round((marks.m1+marks.m2+marks.m3)/3,2)<=89 then 'B'
            else 'C'
        end
    else 'No Grade'
end as GRADE
from students
inner join course on students.cid=course.cid
inner join marks on students.id=marks.id;


-- displaying only mba
select students.NAME,students.ROLLNO,course.cname as COURSE,marks.M1,marks.M2,marks.M3,
(marks.m1+marks.m2+marks.m3) as TOTAL, (round((marks.m1+marks.m2+marks.m3)/3,2)) as AVERAGE,
case
	when marks.m1>=35 and marks.m2>=35 and marks.m3>=35 then 'PASS'
    else 'FAIL'
end as RESULT,
case
	when marks.m1>=35 and marks.m2>=35 and marks.m3>=35 then
		case
			when round((marks.m1+marks.m2+marks.m3)/3,2)>=90 and round((marks.m1+marks.m2+marks.m3)/3,2)<=100 then 'A'
            when round((marks.m1+marks.m2+marks.m3)/3,2)>=80 and round((marks.m1+marks.m2+marks.m3)/3,2)<=89 then 'B'
            else 'C'
        end
    else 'No Grade'
end as GRADE
from students
inner join course on students.cid=course.cid
inner join marks on students.id=marks.id
where course.cname='MBA';


-- displaying only mba pass students
select students.NAME,students.ROLLNO,course.cname as COURSE,marks.M1,marks.M2,marks.M3,
(marks.m1+marks.m2+marks.m3) as TOTAL, (round((marks.m1+marks.m2+marks.m3)/3,2)) as AVERAGE,
case
	when marks.m1>=35 and marks.m2>=35 and marks.m3>=35 then 'PASS'
    else 'FAIL'
end as RESULT,
case
	when marks.m1>=35 and marks.m2>=35 and marks.m3>=35 then
		case
			when round((marks.m1+marks.m2+marks.m3)/3,2)>=90 and round((marks.m1+marks.m2+marks.m3)/3,2)<=100 then 'A'
            when round((marks.m1+marks.m2+marks.m3)/3,2)>=80 and round((marks.m1+marks.m2+marks.m3)/3,2)<=89 then 'B'
            else 'C'
        end
    else 'No Grade'
end as GRADE
from students
inner join course on students.cid=course.cid
inner join marks on students.id=marks.id
where course.cname='mba' having result='pass'; -- (where course.cname='mba' and result='pass') this doesn't work


-- displaying only bca pass student with average between 70 and 100
select students.NAME,students.ROLLNO,course.cname as COURSE,marks.M1,marks.M2,marks.M3,
(marks.m1+marks.m2+marks.m3) as TOTAL, (round((marks.m1+marks.m2+marks.m3)/3,2)) as AVERAGE,
case
	when marks.m1>=35 and marks.m2>=35 and marks.m3>=35 then 'PASS'
    else 'FAIL'
end as RESULT,
case
	when marks.m1>=35 and marks.m2>=35 and marks.m3>=35 then
		case
			when round((marks.m1+marks.m2+marks.m3)/3,2)>=90 and round((marks.m1+marks.m2+marks.m3)/3,2)<=100 then 'A'
            when round((marks.m1+marks.m2+marks.m3)/3,2)>=80 and round((marks.m1+marks.m2+marks.m3)/3,2)<=89 then 'B'
            else 'C'
        end
    else 'No Grade'
end as GRADE
from students
inner join course on students.cid=course.cid
inner join marks on students.id=marks.id
where course.cname='bca' having result='pass' and (average>=70 and average<=100);

-- ----------------------------------------------------------------------------------------------

-- VIEWS:

create view reports as
select students.NAME,students.ROLLNO,course.cname as COURSE,marks.M1,marks.M2,marks.M3,
(marks.m1+marks.m2+marks.m3) as TOTAL, (round((marks.m1+marks.m2+marks.m3)/3,2)) as AVERAGE,
case
	when marks.m1>=35 and marks.m2>=35 and marks.m3>=35 then 'PASS'
    else 'FAIL'
end as RESULT,
case
	when marks.m1>=35 and marks.m2>=35 and marks.m3>=35 then
		case
			when round((marks.m1+marks.m2+marks.m3)/3,2)>=90 and round((marks.m1+marks.m2+marks.m3)/3,2)<=100 then 'A'
            when round((marks.m1+marks.m2+marks.m3)/3,2)>=80 and round((marks.m1+marks.m2+marks.m3)/3,2)<=89 then 'B'
            else 'C'
        end
    else 'No Grade'
end as GRADE
from students
inner join course on students.cid=course.cid
inner join marks on students.id=marks.id;


show tables;
show full tables;

select * from reports;
select name,course,total from reports where result='pass';

drop view reports;

-- ----------------------------------------------------------------------------------------------