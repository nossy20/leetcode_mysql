-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table If Not Exists Followers(user_id int, follower_id int);

Truncate table Followers;

insert into Followers (user_id, follower_id) values ('0', '1');

insert into Followers (user_id, follower_id) values ('1', '0');

insert into Followers (user_id, follower_id) values ('2', '0');

insert into Followers (user_id, follower_id) values ('2', '1');

select
    user_id,
    count(follower_id) as "followers_count"
from `Followers`
GROUP BY user_id
ORDER BY user_id ASC;