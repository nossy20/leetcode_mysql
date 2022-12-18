-- Active: 1668306365956@@127.0.0.1@3306@leetcode

Create table If Not Exists Employee (Id int, Salary int);

Truncate table Employee;

insert into Employee (id, salary) values ('1', '100');

insert into Employee (id, salary) values ('2', '200');

insert into Employee (id, salary) values ('3', '300');

select * from Employee;

-- DETERMINISTIC ルーチンは、同じ入力パラメーターに対して常に同じ結果を生成する場合に「決定的」と見なされ、それ以外の場合は NOT DETERMINISTIC と見なされます。これは主に文字列または数学処理で使用されますが、それに限定されません。

-- NOT DETERMINISTIC 「DETERMINISTIC」の反対。"ルーチン定義で DETERMINISTIC も NOT DETERMINISTIC も指定されていない場合、デフォルトは NOT DETERMINISTIC です。関数が決定論的であることを宣言するには、DETERMINISTIC を明示的に指定する必要があります。 ". そのため、ステートメントが作成されていない場合、MySQl は関数を「NOT DETERMINISTIC」として扱うようです。マニュアルのこの記述は、次のようなマニュアルの別の領域の他の記述と矛盾しています: "ストアド関数を作成するときは、それが決定的であること、またはデータを変更しないことを宣言する必要があります。そうしないと、データの回復やレプリケーションが安全でなくなる可能性があります。デフォルトでは、CREATE FUNCTION ステートメントを受け入れるには、DETERMINISTIC、NO SQL、または READS SQL DATA の少なくとも 1 つを明示的に指定する必要があります。そうしないと、エラーが発生します"

-- https://dev.mysql.com/doc/refman/8.0/ja/stored-programs-logging.html

SET GLOBAL log_bin_trust_function_creators = 1;

delimiter /

CREATE FUNCTION GETNTHHIGHESTSALARY(N INT) RETURNS 
INT BEGIN 
	DECLARE M INT;
	SET M = N -1;
	RETURN (
	        IFNULL( (
	                select
	                    distinct salary
	                from
	                    `Employee`
	                order by
	                    salary desc
	                limit 1
	                offset
	                    M
	            ),
	            NULL
	        )
	    );
	END / 


delimiter ;

select GETNTHHIGHESTSALARY(3);

SHOW FUNCTION STATUS;

SHOW CREATE FUNCTION GETNTHHIGHESTSALARY;

DROP FUNCTION GETNTHHIGHESTSALARY;