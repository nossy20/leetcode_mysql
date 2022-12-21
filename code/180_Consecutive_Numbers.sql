-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table If Not Exists Logs (id int, num int);

Truncate table Logs;

insert into Logs (id, num) values ('1', '1');

insert into Logs (id, num) values ('2', '1');

insert into Logs (id, num) values ('3', '1');

insert into Logs (id, num) values ('4', '2');

insert into Logs (id, num) values ('5', '1');

insert into Logs (id, num) values ('6', '2');

insert into Logs (id, num) values ('7', '2');

select
    -- 3つ以上連続する数字がある場合は複数回出力されるのでDISTINCTをつける
    DISTINCT(l1.num) as "ConsecutiveNums"
from
    `Logs` as l1,
    `Logs` as l2,
    `Logs` as l3
WHERE
    -- 3津連続なので交差結合上のidは連番になっているはず
    l1.id = l2.id -1
    AND l2.id = l3.id -1 -- 3津連続の数字が同じであること
    AND l1.num = l2.num
    AND l2.num = l3.num;