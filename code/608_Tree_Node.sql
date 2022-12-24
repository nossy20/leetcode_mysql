-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table If Not Exists Tree (id int, p_id int);

Truncate table Tree;

insert into Tree (id, p_id) values ('1', null);

insert into Tree (id, p_id) values ('2', '1');

insert into Tree (id, p_id) values ('3', '1');

insert into Tree (id, p_id) values ('4', '2');

insert into Tree (id, p_id) values ('5', '2');

select
    id,
    CASE
        WHEN p_id is NULL THEN "Root"
        WHEN id IN (
            select p_id
            from
                `Tree`
        ) THEN "Inner"
        ELSE "Leaf"
    END AS "type"
from `Tree`;