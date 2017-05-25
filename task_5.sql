declare
    num number(1);
begin
    for num in 1..1000 loop
      dbms_output.put_line(num);
    end loop;
end;