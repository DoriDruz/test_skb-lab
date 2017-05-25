CREATE or REPLACE PROCEDURE balance
  (acc_name in VARCHAR2)
IS
  acc_rows number(10) := 0;
  last_sum NUMBER(10) := 0;
  each_tr NUMBER(10) := 0;
  
  cursor count_acc_rows
  is
    select count(*)
    from d
    where D.ACCOUNT = acc_name;
  
  cursor sum1
  is
    select d.value
    from d
    where d.account = acc_name;
BEGIN
  open count_acc_rows;
  fetch count_acc_rows into acc_rows;
  close count_acc_rows;
  DBMS_OUTPUT.PUT_LINE('Balance for '||acc_name);
  open sum1;
  for i in 1..acc_rows
  loop
    fetch sum1 into each_tr;
    last_sum := last_sum + each_tr;
    DBMS_OUTPUT.PUT_LINE('LEFT: '||last_sum);
  end loop;
  close sum1;
END;