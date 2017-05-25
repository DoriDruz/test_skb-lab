declare
    to_emp_fio varchar2(50);
    to_ownm varchar2(50);
    exc exception;
    flag BOOLEAN := true;
begin
    to_emp_fio := 'New name+';
    to_ownm:= 'New Org+';
    
    FOR check_emp_fio IN (SELECT emp_fio FROM table_c)
    loop
      if check_emp_fio.emp_fio = to_emp_fio
      then 
        raise exc;
        flag := false;
        exit;
      end if;
    end loop;
    if flag = true 
    then
      for check_ownm IN (SELECT ownm FROM table_c)
        loop
          if check_ownm.ownm = to_ownm
          then
            raise exc;
            flag := false;
            exit;
          end if;
        end loop;
    end if;
    if flag = true 
    then
     insert into table_c
     (emp_fio, ownm)
     values
     (to_emp_fio, to_ownm);
    end if;
exception
  when exc then
    dbms_output.put_line('One of fields already exist!');
end;