-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table If Not Exists Person (id int, email varchar(255));

Truncate table Person;

insert into Person (id, email) values ('1', 'a@b.com');

insert into Person (id, email) values ('2', 'c@d.com');

insert into Person (id, email) values ('3', 'a@b.com');

select email as Email
from `Person`
group by email
having COUNT(email) > 1;