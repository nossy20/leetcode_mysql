-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table
    If Not Exists Activity (
        user_id int,
        session_id int,
        activity_date date,
        activity_type ENUM(
            'open_session',
            'end_session',
            'scroll_down',
            'send_message'
        )
    );

Truncate table Activity;

insert into
    Activity (
        user_id,
        session_id,
        activity_date,
        activity_type
    )
values (
        '1',
        '1',
        '2019-07-20',
        'open_session'
    );

insert into
    Activity (
        user_id,
        session_id,
        activity_date,
        activity_type
    )
values (
        '1',
        '1',
        '2019-07-20',
        'scroll_down'
    );

insert into
    Activity (
        user_id,
        session_id,
        activity_date,
        activity_type
    )
values (
        '1',
        '1',
        '2019-07-20',
        'end_session'
    );

insert into
    Activity (
        user_id,
        session_id,
        activity_date,
        activity_type
    )
values (
        '2',
        '4',
        '2019-07-20',
        'open_session'
    );

insert into
    Activity (
        user_id,
        session_id,
        activity_date,
        activity_type
    )
values (
        '2',
        '4',
        '2019-07-21',
        'send_message'
    );

insert into
    Activity (
        user_id,
        session_id,
        activity_date,
        activity_type
    )
values (
        '2',
        '4',
        '2019-07-21',
        'end_session'
    );

insert into
    Activity (
        user_id,
        session_id,
        activity_date,
        activity_type
    )
values (
        '3',
        '2',
        '2019-07-21',
        'open_session'
    );

insert into
    Activity (
        user_id,
        session_id,
        activity_date,
        activity_type
    )
values (
        '3',
        '2',
        '2019-07-21',
        'send_message'
    );

insert into
    Activity (
        user_id,
        session_id,
        activity_date,
        activity_type
    )
values (
        '3',
        '2',
        '2019-07-21',
        'end_session'
    );

insert into
    Activity (
        user_id,
        session_id,
        activity_date,
        activity_type
    )
values (
        '4',
        '3',
        '2019-06-25',
        'open_session'
    );

insert into
    Activity (
        user_id,
        session_id,
        activity_date,
        activity_type
    )
values (
        '4',
        '3',
        '2019-06-25',
        'end_session'
    );

-- 30日間で07-27を含むので、Intervalは29日

SELECT
    activity_date as day,
    COUNT(DISTINCT(user_id)) AS active_users
FROM Activity
WHERE
    activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY)
    AND '2019-07-27'
GROUP BY day
ORDER BY day ASC;