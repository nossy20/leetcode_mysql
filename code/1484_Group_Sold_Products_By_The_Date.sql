-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table
    If Not Exists Activities (
        sell_date date,
        product varchar(20)
    );

Truncate table Activities;

insert into
    Activities (sell_date, product)
values ('2020-05-30', 'Headphone');

insert into
    Activities (sell_date, product)
values ('2020-06-01', 'Pencil');

insert into
    Activities (sell_date, product)
values ('2020-06-02', 'Mask');

insert into
    Activities (sell_date, product)
values ('2020-05-30', 'Basketball');

insert into
    Activities (sell_date, product)
values ('2020-06-01', 'Bible');

insert into
    Activities (sell_date, product)
values ('2020-06-02', 'Mask');

insert into
    Activities (sell_date, product)
values ('2020-05-30', 'T-Shirt');

-- group_concatする前に日付と商品でソートしておくことで、group_concatの結果productsがASCでソートされた状態になる

select
    t.sell_date,
    count(DISTINCT(t.product)) as "num_sold",
    GROUP_CONCAT(DISTINCT(t.product)) as "products"
from (
        select
            sell_date,
            product
        from Activities
        order by
            sell_date,
            product
    ) as t
GROUP BY sell_date;