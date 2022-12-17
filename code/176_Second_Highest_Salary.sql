-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table If Not Exists Employee (id int, salary int);

Truncate table Employee;

insert into Employee (id, salary) values ('1', '100');

insert into Employee (id, salary) values ('2', '200');

insert into Employee (id, salary) values ('3', '300');

-- IFNULL関数は第1引数に指定したカラム名がNULLのときに、第2引数に指定した値で置き換える

select IFNULL( (
            SELECT
                DISTINCT salary
            FROM `Employee`
            order by
                salary desc
            limit
                1, 1
        ), null
    ) as "SecondHighestSalary";