-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table
    If Not Exists Weather (
        id int,
        recordDate date,
        temperature int
    );

Truncate table Weather;

insert into
    Weather (id, recordDate, temperature)
values ('1', '2015-01-01', '10');

insert into
    Weather (id, recordDate, temperature)
values ('2', '2015-01-02', '25');

insert into
    Weather (id, recordDate, temperature)
values ('3', '2015-01-03', '20');

insert into
    Weather (id, recordDate, temperature)
values ('4', '2015-01-04', '30');

select b.id
from `Weather` a, `Weather` b
WHERE
    b.temperature - a.temperature > 0
    and DATEDIFF(
        b.`recordDate`,
        a.`recordDate`
    ) = 1;