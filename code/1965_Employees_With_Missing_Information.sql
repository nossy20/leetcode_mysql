-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table
    If Not Exists Employees (
        employee_id int,
        name varchar(30)
    );

Create table If Not Exists Salaries (employee_id int, salary int);

Truncate table Employees;

insert into Employees (employee_id, name) values ('2', 'Crew');

insert into Employees (employee_id, name) values ('4', 'Haven');

insert into Employees (employee_id, name) values ('5', 'Kristian');

Truncate table Salaries;

insert into Salaries (employee_id, salary) values ('5', '76071');

insert into Salaries (employee_id, salary) values ('1', '22517');

insert into Salaries (employee_id, salary) values ('4', '63539');

-- Employeesのemployee_idとSalaryesのemployee_idを同一の列にし、countが2未満のものを抽出する

with v as (
        select *
        from `Employees`
        union all
        select *
        from `Salaries`
    )
select employee_id
from v
group by employee_id
having count(*) < 2
ORDER BY employee_id ASC;