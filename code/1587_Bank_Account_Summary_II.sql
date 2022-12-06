-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table If Not Exists Users (account int, name varchar(20));

Create table
    If Not Exists Transactions (
        trans_id int,
        account int,
        amount int,
        transacted_on date
    );

Truncate table Users;

insert into Users (account, name) values ('900001', 'Alice');

insert into Users (account, name) values ('900002', 'Bob');

insert into Users (account, name) values ('900003', 'Charlie');

Truncate table Transactions;

insert into
    Transactions (
        trans_id,
        account,
        amount,
        transacted_on
    )
values (
        '1',
        '900001',
        '7000',
        '2020-08-01'
    );

insert into
    Transactions (
        trans_id,
        account,
        amount,
        transacted_on
    )
values (
        '2',
        '900001',
        '7000',
        '2020-09-01'
    );

insert into
    Transactions (
        trans_id,
        account,
        amount,
        transacted_on
    )
values (
        '3',
        '900001',
        '-3000',
        '2020-09-02'
    );

insert into
    Transactions (
        trans_id,
        account,
        amount,
        transacted_on
    )
values (
        '4',
        '900002',
        '1000',
        '2020-09-12'
    );

insert into
    Transactions (
        trans_id,
        account,
        amount,
        transacted_on
    )
values (
        '5',
        '900003',
        '6000',
        '2020-08-07'
    );

insert into
    Transactions (
        trans_id,
        account,
        amount,
        transacted_on
    )
values (
        '6',
        '900003',
        '6000',
        '2020-09-07'
    );

insert into
    Transactions (
        trans_id,
        account,
        amount,
        transacted_on
    )
values (
        '7',
        '900003',
        '-4000',
        '2020-09-11'
    );

select * from `Users`;

select * from `Transactions`;

with temp AS (
        select
            account,
            SUM(amount) as "balance"
        from `Transactions`
        GROUP BY account
        HAVING
            SUM(amount) > 10000
    )
select a.name, b.balance
from `Users` as a
    inner join temp as b on a.account = b.account;