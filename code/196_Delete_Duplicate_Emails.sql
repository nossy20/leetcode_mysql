-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table If Not Exists Person (Id int, Email varchar(255));

Truncate table Person;

insert into Person (id, email) values ('1', 'john@example.com');

insert into Person (id, email) values ('2', 'bob@example.com');

insert into Person (id, email) values ('3', 'john@example.com');

select * from `Person`;

delete a
from `Person` as a
    inner join `Person` as b on a.id > b.id and a.`Email` = b.`Email`;