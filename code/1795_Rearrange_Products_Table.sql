-- Active: 1668306365956@@127.0.0.1@3306

Create table
    If Not Exists Products (
        product_id int,
        store1 int,
        store2 int,
        store3 int
    );

Truncate table Products;

insert into
    Products (
        product_id,
        store1,
        store2,
        store3
    )
values ('0', '95', '100', '105');

insert into
    Products (
        product_id,
        store1,
        store2,
        store3
    )
values ('1', '70', null, '80');

select
    t.product_id,
    t.store,
    t.price
from (
        select
            product_id,
            "store1" as store,
            store1 as price
        from Products
        union all
        select
            product_id,
            "store2" as store,
            store2 as price
        from Products
        union all
        select
            product_id,
            "store3" as store,
            store3 as price
        from Products
    ) as t
where t.price is not null
order by
    product_id ASC,
    price ASC;

-- 0, 95, 100, 105