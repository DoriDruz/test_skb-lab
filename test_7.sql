declare
  test_xml XMLType;
begin
  test_xml:= XMLType('<SKB><S>�����</S><K>�����</K><B>����</B></SKB>');
  dbms_output.put_line(test_xml.GetClobVal());
  select updatexml(test_xml, 'SKB/K/text()', '������') into test_xml from dual;
  dbms_output.put_line(test_xml.GetClobVal());
end;