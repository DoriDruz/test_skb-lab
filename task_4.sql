declare
    salary INTEGER := 12345;
    bonus INTEGER;
begin
  case
    when salary < 10000 then bonus:=2000;
    when salary < 20000 then bonus:=1000;
    when salary < 40000 then bonus:=1500;
    else bonus:=500;
  end case;
  dbms_output.put_line(bonus);
end;
