-- Active: 1668306365956@@127.0.0.1@3306

Create table
    If Not Exists ActorDirector (
        actor_id int,
        director_id int,
        timestamp int
    );

Truncate table ActorDirector;

insert into
    ActorDirector (
        actor_id,
        director_id,
        timestamp
    )
values ('1', '1', '0');

insert into
    ActorDirector (
        actor_id,
        director_id,
        timestamp
    )
values ('1', '1', '1');

insert into
    ActorDirector (
        actor_id,
        director_id,
        timestamp
    )
values ('1', '1', '2');

insert into
    ActorDirector (
        actor_id,
        director_id,
        timestamp
    )
values ('1', '2', '3');

insert into
    ActorDirector (
        actor_id,
        director_id,
        timestamp
    )
values ('1', '2', '4');

insert into
    ActorDirector (
        actor_id,
        director_id,
        timestamp
    )
values ('2', '1', '5');

insert into
    ActorDirector (
        actor_id,
        director_id,
        timestamp
    )
values ('2', '1', '6');

select * from `ActorDirector`;

select actor_id, director_id
from `ActorDirector`
group by
    actor_id,
    director_id
having count(*) >= 3;