create table employee(
EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Department varchar(50),
Salary int
);

select * from employee;

insert into employee(EmployeeID, FirstName, LastName, Department, Salary) 
values (1,"John","Doe","HR",55000),
(2,"Jane","Smith","IT",60000),
(3,"Bob","Johnson","IT",62000),
(4,"Alice","Williams","HR",54000),
(5,"Eva","Davis","Finance",58000),
(6,"Mile","Brown","Finance",59000);

select * from employee order by LastName asc;
select * from employee where department="IT" order by salary desc;
select count(employeeid), department from employee group by department;
select avg(salary),department from employee group by department order by department;
select avg(salary),department from employee group by department order by department desc limit 1;
select avg(salary),department from employee group by department having avg(salary) < 60000;

select department from employee group by department having avg(salary) > 55000 or count(department) > 2;