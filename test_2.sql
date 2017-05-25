declare
  type ints_in IS VARRAY(10) OF INTEGER;
  some_arr ints_in := ints_in(2, 4, 1, 3, 2, 3, 7, 6, 11, 10);
  n number(10) := 1;
  tmp number(10);
begin
    while n < some_arr.count
    loop
      for i in 1..(some_arr.count - n) 
      loop
        if some_arr(i) > some_arr(i+1) then
          tmp := some_arr(i);
          some_arr(i) := some_arr(i+1);
          some_arr(i+1) := tmp;
        end if;
      end loop;
      n := n+1;
    end loop;
    for i in some_arr.first..some_arr.last 
    loop
      dbms_output.put_line(some_arr(i));
    end loop;
end;