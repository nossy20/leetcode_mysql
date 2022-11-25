-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table
    If Not Exists Salary (
        id int,
        name varchar(100),
        sex char(1),
        salary int
    );

Truncate table Salary;

insert into
    Salary (id, name, sex, salary)
values ('1', 'A', 'm', '2500');

insert into
    Salary (id, name, sex, salary)
values ('2', 'B', 'f', '1500');

insert into
    Salary (id, name, sex, salary)
values ('3', 'C', 'm', '5500');

insert into
    Salary (id, name, sex, salary)
values ('4', 'D', 'f', '500');

select * from `Salary`;

-- 三項演算子 "f" if sex == "m" else "f"

UPDATE `Salary` SET sex = IF(sex = "f", "m", "f");