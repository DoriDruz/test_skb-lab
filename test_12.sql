create table table_e
(
  info NUMBER(10),
  date_info DATE
);
----------------------------------------
create or replace function get_rand_date
return date
is
  tmp date;
  tmp_day varchar2(50);
  tmp_month varchar2(50);
  tmp_year varchar2(50);
begin
  tmp_day := to_char(round(dbms_random.value(10,30)));
  tmp_month := to_char(round(dbms_random.value(10,12)));
  tmp_year := to_char(round(dbms_random.value(2007, 2017)));
  tmp := to_date(concat(concat(tmp_day, tmp_month), tmp_year), 'ddmmyyyy');
return tmp;
end;
----------------------------------------
declare
  tmp_number number(10);
  tmp_date date;
begin
  for i in 1..20 loop
    tmp_number := round(DBMS_RANDOM.value(1,100));
    tmp_date := get_rand_date();
    insert into table_e values (tmp_number, tmp_date);
  end loop;
end;
-----------------------------------------
create or replace PROCEDURE sort_date
is
  type info_var is table of table_e.info%type; 
  type info_val is table of table_e.date_info%type;
  tmp info_var;
  tmp_value info_val;
  tmp_diff number(10);
  
  cursor sort_c1
  is
  select *
  from table_e
  ORDER BY date_info;
begin
  open sort_c1;
  fetch sort_c1 bulk collect into tmp, tmp_value;
  close sort_c1;
  
  for i in tmp.first..tmp.last loop
    if i > 1 then
      tmp_diff := tmp_value(i)-tmp_value(i-1);
    else
      tmp_diff := 0;
    end if;
    dbms_output.put_line(tmp(i)||' - '||tmp_value(i)||' - '||tmp_diff||' days');
  end loop;
end;
-----------------------------------------
begin
  sort_date();
end;
-----------------------------------------
select info, date_info, to_number(date_info - LAG(DATE_INFO) OVER (ORDER BY date_info)) AS Diff from table_e ORDER BY DATE_INFO;