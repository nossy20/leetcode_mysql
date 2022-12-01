-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create Table If Not Exists Users (id int, name varchar(30));

Create Table If Not Exists Rides (id int, user_id int, distance int);

Truncate table Users;

insert into Users (id, name) values ('1', 'Alice');

insert into Users (id, name) values ('2', 'Bob');

insert into Users (id, name) values ('3', 'Alex');

insert into Users (id, name) values ('4', 'Donald');

insert into Users (id, name) values ('7', 'Lee');

insert into Users (id, name) values ('13', 'Jonathan');

insert into Users (id, name) values ('19', 'Elvis');

Truncate table Rides;

insert into Rides (id, user_id, distance) values ('1', '1', '120');

insert into Rides (id, user_id, distance) values ('2', '2', '317');

insert into Rides (id, user_id, distance) values ('3', '3', '222');

insert into Rides (id, user_id, distance) values ('4', '7', '100');

insert into Rides (id, user_id, distance) values ('5', '13', '312');

insert into Rides (id, user_id, distance) values ('6', '19', '50');

insert into Rides (id, user_id, distance) values ('7', '7', '120');

insert into Rides (id, user_id, distance) values ('8', '19', '400');

insert into Rides (id, user_id, distance) values ('9', '7', '230');

select * from `Rides`;

select * from `Users`;

with dis AS (
        select
            user_id,
            sum(distance) as "travelled_distance"
        from `Rides`
        GROUP BY user_id
    )
select
    a.name,
    COALESCE(b.travelled_distance, 0) as "travelled_distance"
from `Users` as a
    LEFT JOIN `dis` as b ON a.id = b.user_id
ORDER BY
    b.travelled_distance DESC,
    a.name ASC