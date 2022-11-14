-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table
    If Not Exists Employee (
        id int,
        name varchar(255),
        salary int,
        managerId int
    );

Truncate table Employee;

insert into
    Employee (id, name, salary, managerId)
values ('1', 'Joe', '70000', '3');

insert into
    Employee (id, name, salary, managerId)
values ('2', 'Henry', '80000', '4');

insert into
    Employee (id, name, salary, managerId)
values ('3', 'Sam', '60000', Null);

insert into
    Employee (id, name, salary, managerId)
values ('4', 'Max', '90000', Null);

select a.name as Employee
from `Employee` as a
    inner join `Employee` as b on a.`managerId` = b.`id` and a.salary > b.salary;