-- Active: 1668306365956@@127.0.0.1@3306

Create table If Not Exists Scores (id int, score DECIMAL(3,2));

Truncate table Scores;

insert into Scores (id, score) values ('1', '3.5');

insert into Scores (id, score) values ('2', '3.65');

insert into Scores (id, score) values ('3', '4.0');

insert into Scores (id, score) values ('4', '3.85');

insert into Scores (id, score) values ('5', '4.0');

insert into Scores (id, score) values ('6', '3.65');

select * from Scores;

-- Window関数を利用する(バージョン8.0以降)

-- ウィンドウ関数は、一連のクエリ行に対して集計のような操作を実行します。

-- ただし、集計操作ではクエリ行が 1 つの結果行にグループ化されますが、

-- ウィンドウ関数ではクエリ行ごとに結果が生成されます。

SELECT
    S.score,
    DENSE_RANK() OVER (
        ORDER BY
            S.score DESC
    ) AS 'rank'
FROM Scores S;