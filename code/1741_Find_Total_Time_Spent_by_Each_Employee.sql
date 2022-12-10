-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table
    If Not Exists Employees(
        emp_id int,
        event_day date,
        in_time int,
        out_time int
    );

Truncate table Employees;

insert into
    Employees (
        emp_id,
        event_day,
        in_time,
        out_time
    )
values ('1', '2020-11-28', '4', '32');

insert into
    Employees (
        emp_id,
        event_day,
        in_time,
        out_time
    )
values ('1', '2020-11-28', '55', '200');

insert into
    Employees (
        emp_id,
        event_day,
        in_time,
        out_time
    )
values ('1', '2020-12-3', '1', '42');

insert into
    Employees (
        emp_id,
        event_day,
        in_time,
        out_time
    )
values ('2', '2020-11-28', '3', '33');

insert into
    Employees (
        emp_id,
        event_day,
        in_time,
        out_time
    )
values ('2', '2020-12-9', '47', '74');

select
    event_day as "day",
    emp_id,
    sum(out_time - in_time) as "total_time"
from `Employees`
Group by event_day, emp_id
ORDER BY
    event_day ASC,
    emp_id ASC;