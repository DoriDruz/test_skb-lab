create table d2_info
(
  acc varchar(50) not null,
  acc_value number(10) not null 
);
---------------------------------------
CREATE OR REPLACE TRIGGER update_balance
AFTER INSERT
  ON D2
DECLARE
  acc_name varchar2(50);
  acc_bal number(10);
  all_bal number(10);
  table_len number(10);
  
  cursor len
  is
  select count(*)
  from d2;
  
  cursor c1
  is 
  select d2.account
  from d2
  where d2.id = table_len;
  
  cursor c2
  is
  SELECT d2.value
  from d2
  where d2.id = table_len;
  
  cursor c3
  is
  select d2_info.acc_value
  from d2_info
  where d2_info.acc = acc_name;
BEGIN
  open len;
  fetch len into table_len;
  close len;
  
  open c1;
  fetch c1 into acc_name;
  close c1;
  
  if table_len = 1 then
    open c2;
    fetch c2 into all_bal;
    close c2;
  else
    open c2;
    fetch c2 into acc_bal;
    close c2;
    open c3;
    for i in 1..table_len loop
      fetch c3 into all_bal;
    end loop;
    close c3;
    if all_bal is null then
      all_bal := acc_bal;
    else
      all_bal := all_bal + acc_bal;
    end if;
  end if;
  
  insert into d2_info
  (acc, acc_value)
  values
  (acc_name, all_bal);
  
  DBMS_OUTPUT.PUT_LINE('Balance for '||acc_name||' : '||all_bal);
  
END;