-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table If Not Exists Users (user_id int, name varchar(40));

Truncate table Users;

insert into Users (user_id, name) values ('1', 'aLice');

insert into Users (user_id, name) values ('2', 'bOB');

select * from `Users`;

SELECT
    user_id,
    CONCAT (
        UPPER(SUBSTRING(name, 1, 1)),
        LOWER(SUBSTRING(name, 2))
    ) as "name"
FROM `Users`
ORDER BY user_id;