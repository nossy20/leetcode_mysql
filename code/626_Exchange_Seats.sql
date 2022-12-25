-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table If Not Exists Seat (id int, student varchar(255));

Truncate table Seat;

insert into Seat (id, student) values ('1', 'Abbot');

insert into Seat (id, student) values ('2', 'Doris');

insert into Seat (id, student) values ('3', 'Emerson');

insert into Seat (id, student) values ('4', 'Green');

insert into Seat (id, student) values ('5', 'Jeames');

select count(*) from `Seat`;

SELECT (
        CASE -- 最終のidではなく、奇数の時
            WHEN MOD(id, 2) != 0
            AND counts != id THEN id + 1 -- 最終のidで、奇数のとき
            WHEN MOD(id, 2) != 0
            AND counts = id THEN id -- 偶数はすべて-1
            ELSE id - 1
        END
    ) AS id,
    student -- `Seat`にcount列を追加し、最終行を判断できるようにする
FROM `Seat`, (
        SELECT
            COUNT(*) AS counts
        FROM
            `Seat`
    ) AS seat_counts
ORDER BY id ASC;