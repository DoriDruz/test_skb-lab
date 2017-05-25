CREATE TABLE table_a
( emp_fio varchar2(50) NOT NULL
);

CREATE TABLE table_b
( ownm varchar2(50) NOT NULL
);

CREATE TABLE table_c
( ownm varchar2(50) NOT NULL,
  emp_fio varchar2(50) NOT NULL
);

insert into table_a
(emp_info)
VALUES
('George_White');

insert into table_b
(ownm)
VALUES
('Developers');

insert into table_c
(ownm, emp_fio)
SELECT ownm, emp_fio
FROM TABLE_A, TABLE_B;