--C -> B -> A
select /*+ ORDERED */ * from table_c, table_b, table_a where table_c.ownm=table_b.ownm and table_c.emp_fio=table_a.emp_fio;
-------------------------------------------------------------------------------
| Id  | Operation           | Name    | Rows  | Bytes | Cost (%CPU)| Time     |
-------------------------------------------------------------------------------
|   0 | SELECT STATEMENT    |         |     4 |   152 |     9   (0)| 00:00:01 |
|*  1 |  HASH JOIN          |         |     4 |   152 |     9   (0)| 00:00:01 |
|*  2 |   HASH JOIN         |         |     4 |   116 |     6   (0)| 00:00:01 |
|   3 |    TABLE ACCESS FULL| TABLE_C |     5 |   100 |     3   (0)| 00:00:01 |
|   4 |    TABLE ACCESS FULL| TABLE_B |     4 |    36 |     3   (0)| 00:00:01 |
|   5 |   TABLE ACCESS FULL | TABLE_A |     4 |    36 |     3   (0)| 00:00:01 |
-------------------------------------------------------------------------------

--C -> A -> B
select /*+ ORDERED */ * from table_c, table_a, table_b where table_c.emp_fio=table_a.emp_fio and table_c.ownm=table_b.ownm;
-------------------------------------------------------------------------------
| Id  | Operation           | Name    | Rows  | Bytes | Cost (%CPU)| Time     |
-------------------------------------------------------------------------------
|   0 | SELECT STATEMENT    |         |     3 |   114 |     9   (0)| 00:00:01 |
|*  1 |  HASH JOIN          |         |     3 |   114 |     9   (0)| 00:00:01 |
|*  2 |   HASH JOIN         |         |     4 |   116 |     6   (0)| 00:00:01 |
|   3 |    TABLE ACCESS FULL| TABLE_C |     5 |   100 |     3   (0)| 00:00:01 |
|   4 |    TABLE ACCESS FULL| TABLE_A |     4 |    36 |     3   (0)| 00:00:01 |
|   5 |   TABLE ACCESS FULL | TABLE_B |     4 |    36 |     3   (0)| 00:00:01 |
-------------------------------------------------------------------------------