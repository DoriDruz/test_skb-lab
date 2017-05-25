declare
  test_xml XMLType;
begin
  test_xml:= XMLType('<SKB><S>Самый</S><K>Клёвый</K><B>Банк</B></SKB>');
  dbms_output.put_line(test_xml.GetClobVal());
  select updatexml(test_xml, 'SKB/K/text()', 'Крутой') into test_xml from dual;
  dbms_output.put_line(test_xml.GetClobVal());
end;