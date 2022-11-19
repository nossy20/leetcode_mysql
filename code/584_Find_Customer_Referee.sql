-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table
    If Not Exists Customer (
        id int,
        name varchar(25),
        referee_id int
    );

Truncate table Customer;

insert into
    Customer (id, name, referee_id)
values ('1', 'Will', null);

insert into
    Customer (id, name, referee_id)
values ('2', 'Jane', null);

insert into
    Customer (id, name, referee_id)
values ('3', 'Alex', '2');

insert into
    Customer (id, name, referee_id)
values ('4', 'Bill', null);

insert into
    Customer (id, name, referee_id)
values ('5', 'Zack', '1');

insert into
    Customer (id, name, referee_id)
values ('6', 'Mark', '2');

select * from `Customer`;

select name
from `Customer`
where
    not referee_id = 2
    or referee_id is null;