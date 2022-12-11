-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table
    If Not Exists Products (
        product_id int,
        low_fats ENUM('Y', 'N'),
        recyclable ENUM('Y', 'N')
    );

Truncate table Products;

insert into
    Products (
        product_id,
        low_fats,
        recyclable
    )
values ('0', 'Y', 'N');

insert into
    Products (
        product_id,
        low_fats,
        recyclable
    )
values ('1', 'Y', 'Y');

insert into
    Products (
        product_id,
        low_fats,
        recyclable
    )
values ('2', 'N', 'Y');

insert into
    Products (
        product_id,
        low_fats,
        recyclable
    )
values ('3', 'Y', 'Y');

insert into
    Products (
        product_id,
        low_fats,
        recyclable
    )
values ('4', 'N', 'N');

select product_id
from `Products`
where
    low_fats = "Y"
    and recyclable = "Y"
ORDER BY product_id ASC;