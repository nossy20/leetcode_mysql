-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table
    If Not Exists orders (
        order_number int,
        customer_number int
    );

Truncate table orders;

insert into orders (order_number, customer_number) values ('1', '1');

insert into orders (order_number, customer_number) values ('2', '2');

insert into orders (order_number, customer_number) values ('3', '3');

insert into orders (order_number, customer_number) values ('4', '3');

select * from `orders`;

select customer_number
from `orders`
group by customer_number
order by count(*) desc
limit 1;