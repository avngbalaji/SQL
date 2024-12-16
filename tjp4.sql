-- TRIGGERS
show tables;

create table product(
	pid int not null auto_increment,
    pname varchar(50) not null,
    rate int not null,
    primary key(pid)
);

insert into product (pname, rate) values ('Pen',10),('Box',75),('Pen Drive',200),('Mouse',150),('Keyboard',25);

select * from product;

create table price_logs(
	id int auto_increment,
    pid int,
    price int,
    new_price int,
    primary key(id)
);

select * from price_logs; -- in this price log the values has to be inserted automatically 

/*
Trigger Syntax:

create trigger | trigger_name | trigger_time | trigger_event | on table_name | for each row
begin
...
end;

trigger_time -> before, after
trigger_event -> insert, update, delete
*/

/*
create trigger before_products_update
	before update on product
    for each row
begin
	insert into price_logs(pid,price,new_price)
    values(old.pid,old.rate,new.rate);
end$$
*/

/*
we can't use trigger in mysql workbench,
open MySQL command line client

change the delimiter by using the command
delimiter $$

after completion 
delimiter ;
*/

/*
update product set rate=350 where pid=5;
*/

select * from product;
select * from price_logs;