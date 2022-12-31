-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table
    If Not Exists Trips (
        id int,
        client_id int,
        driver_id int,
        city_id int,
        status ENUM(
            'completed',
            'cancelled_by_driver',
            'cancelled_by_client'
        ),
        request_at varchar(50)
    );

Create table
    If Not Exists Users (
        users_id int,
        banned varchar(50),
        role ENUM('client', 'driver', 'partner')
    );

Truncate table Trips;

insert into
    Trips (
        id,
        client_id,
        driver_id,
        city_id,
        status,
        request_at
    )
values (
        '1',
        '1',
        '10',
        '1',
        'completed',
        '2013-10-01'
    );

insert into
    Trips (
        id,
        client_id,
        driver_id,
        city_id,
        status,
        request_at
    )
values (
        '2',
        '2',
        '11',
        '1',
        'cancelled_by_driver',
        '2013-10-01'
    );

insert into
    Trips (
        id,
        client_id,
        driver_id,
        city_id,
        status,
        request_at
    )
values (
        '3',
        '3',
        '12',
        '6',
        'completed',
        '2013-10-01'
    );

insert into
    Trips (
        id,
        client_id,
        driver_id,
        city_id,
        status,
        request_at
    )
values (
        '4',
        '4',
        '13',
        '6',
        'cancelled_by_client',
        '2013-10-01'
    );

insert into
    Trips (
        id,
        client_id,
        driver_id,
        city_id,
        status,
        request_at
    )
values (
        '5',
        '1',
        '10',
        '1',
        'completed',
        '2013-10-02'
    );

insert into
    Trips (
        id,
        client_id,
        driver_id,
        city_id,
        status,
        request_at
    )
values (
        '6',
        '2',
        '11',
        '6',
        'completed',
        '2013-10-02'
    );

insert into
    Trips (
        id,
        client_id,
        driver_id,
        city_id,
        status,
        request_at
    )
values (
        '7',
        '3',
        '12',
        '6',
        'completed',
        '2013-10-02'
    );

insert into
    Trips (
        id,
        client_id,
        driver_id,
        city_id,
        status,
        request_at
    )
values (
        '8',
        '2',
        '12',
        '12',
        'completed',
        '2013-10-03'
    );

insert into
    Trips (
        id,
        client_id,
        driver_id,
        city_id,
        status,
        request_at
    )
values (
        '9',
        '3',
        '10',
        '12',
        'completed',
        '2013-10-03'
    );

insert into
    Trips (
        id,
        client_id,
        driver_id,
        city_id,
        status,
        request_at
    )
values (
        '10',
        '4',
        '13',
        '12',
        'cancelled_by_driver',
        '2013-10-03'
    );

Truncate table Users;

insert into
    Users (users_id, banned, role)
values ('1', 'No', 'client');

insert into
    Users (users_id, banned, role)
values ('2', 'Yes', 'client');

insert into
    Users (users_id, banned, role)
values ('3', 'No', 'client');

insert into
    Users (users_id, banned, role)
values ('4', 'No', 'client');

insert into
    Users (users_id, banned, role)
values ('10', 'No', 'driver');

insert into
    Users (users_id, banned, role)
values ('11', 'No', 'driver');

insert into
    Users (users_id, banned, role)
values ('12', 'No', 'driver');

insert into
    Users (users_id, banned, role)
values ('13', 'No', 'driver');

with t as (
        select *
        from `Trips` as a
            inner join `Users` as b on a.client_id = b.users_id
        where
            b.banned = 'No'
            and a.request_at between '2013-10-01' and '2013-10-03'
            and a.driver_id not in (
                select
                    users_id
                from `Users`
                where
                    banned = 'Yes'
            )
    )
select
    b.request_at as "Day",
    IFNULL(round(c.cancel / b.all, 2), 0) as "Cancellation Rate"
from (
        select
            request_at,
            count(*) as "all"
        from t
        GROUP BY
            request_at
    ) as b
    left outer join (
        select
            request_at,
            count(*) as "cancel"
        from t
        where
            status <> 'completed'
        GROUP BY
            request_at
    ) as c on b.request_at = c.request_at
ORDER BY b.request_at asc;

select
    t.Request_at Day,
    ROUND( (
            count(
                IF(
                    t.status != 'completed',
                    TRUE,
                    null
                )
            ) / count(*)
        ),
        2
    ) as 'Cancellation Rate'
from Trips t
where t.Client_Id in (
        Select Users_Id
        from Users
        where
            Banned = 'No'
    )
    and t.Driver_Id in (
        Select Users_Id
        from Users
        where
            Banned = 'No'
    )
    and t.Request_at between '2013-10-01' and '2013-10-03'
group by t.Request_at;