-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table
    If Not Exists Stadium (
        id int,
        visit_date DATE NULL,
        people int
    );

Truncate table Stadium;

insert into
    Stadium (id, visit_date, people)
values ('1', '2017-01-01', '10');

insert into
    Stadium (id, visit_date, people)
values ('2', '2017-01-02', '109');

insert into
    Stadium (id, visit_date, people)
values ('3', '2017-01-03', '150');

insert into
    Stadium (id, visit_date, people)
values ('4', '2017-01-04', '99');

insert into
    Stadium (id, visit_date, people)
values ('5', '2017-01-05', '145');

insert into
    Stadium (id, visit_date, people)
values ('6', '2017-01-06', '1455');

insert into
    Stadium (id, visit_date, people)
values ('7', '2017-01-07', '199');

insert into
    Stadium (id, visit_date, people)
values ('8', '2017-01-09', '188');

-- 重複した結果を除外するために distinct を使用する

select distinct t1.*
from
    Stadium t1,
    Stadium t2,
    Stadium t3 -- すべての組み合わせを算出する
where
    -- 3つのテーブルの人数が100以上
    t1.people >= 100
    and t2.people >= 100
    and t3.people >= 100
    and ( (
            t1.id - t2.id = 1
            and t1.id - t3.id = 2
            and t2.id - t3.id = 1
        ) -- t1, t2, t3 3つのテーブルのIDが連続
        or (
            t2.id - t1.id = 1
            and t2.id - t3.id = 2
            and t1.id - t3.id = 1
        ) -- t2, t1, t3 3つのテーブルのIDが連続
        or (
            t3.id - t2.id = 1
            and t2.id - t1.id = 1
            and t3.id - t1.id = 2
        ) -- t3, t2, t1 3つのテーブルのIDが連続
    )
ORDER BY t1.id;