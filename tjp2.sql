-- Employee Table

create table emp(
	id integer unsigned not null auto_increment,
    name varchar(45) not null,
    design varchar(45) not null, -- designation
    doj date not null,
    primary key(id)
);

insert into emp (name,design,doj) values
('Ram','Manager','2018-09-10'),
('Sam','HR','2018-09-10'),
('Tom','AMC','2018-09-11'),
('Ravi','Sales','2018-09-23'),
('Kumar','Sales','2018-10-02');

select * from emp;

-- Salary Table

create table salary(
	sid int not null auto_increment,
    id int not null,
    sdate date not null,
    amt int not null,
    primary key(sid)
);

insert into salary (id,sdate,amt) values
(1,'2018-09-01',10000),
(2,'2018-09-01',7500),
(3,'2018-09-01',6000),
(4,'2018-09-01',4000);

select * from salary;

-- ----------------------------------------------------------------------------------------------

select emp.name, emp.design, salary.sdate, salary.amt from emp inner join salary on emp.id=salary.id;
select emp.name, emp.design, salary.sdate, salary.amt from emp left join salary on emp.id=salary.id;
select emp.name, emp.design, salary.sdate, salary.amt from emp right join salary on emp.id=salary.id;