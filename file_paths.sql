CISC 7510X HW# 8 

create table file(id int, parentid int, name varchar(1024), size int, type char(1)); 

insert into file values(1, null, files, 3, D);
insert into file values(2, 1, haha, 4, F);
insert into file values(3, 1, lol, 4, F);
insert into file values(4, 1, what, 2, D);
insert into file values(5, 4, so, 6, F);
insert into file values(6, 4, cuz, 6, F);

test=# select * from file;
 id | parentid | name  | size | type
----+----------+-------+------+------
  1 |          | files |    3 | D
  2 |        1 | haha  |    4 | F
  3 |        1 | lol   |    4 | F
  4 |        1 | what  |    2 | D
  5 |        4 | so    |    6 | F
  6 |        4 | cuz   |    6 | F
(6 rows)

WITH recursive paths (id, path, type) AS (
	
	SELECT a.id, cast('/' || a.name as varchar(20)) as path, a.type
    FROM file a
    WHERE parentid is null
    UNION ALL
    SELECT a.id, cast(path  || '/' ||  name as varchar(20)), a.type
    FROM file a
    INNER JOIN paths b
        ON a.parentid = b.id 

	
)

SELECT id, path, type
FROM paths
where type = 'F';
 id |      path
----+-----------------
  1 | /files
  2 | /files/haha
  3 | /files/lol
  4 | /files/what
  5 | /files/what/so
  6 | /files/what/cuz
(6 rows)

