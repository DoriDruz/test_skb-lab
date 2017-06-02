declare
  type arr IS VARRAY(3) OF VARCHAR2(10);
  skb_name arr;
  test_xml XMLType;
  parse_str XMLType;
  
begin
  skb_name := arr('S', 'K', 'B');
  test_xml:= XMLType('<SKB><S>Самый</S><K>Клёвый</K><B>Банк</B></SKB>');
  dbms_output.put_line(test_xml.GetClobVal());
  --------------------------------------------
  for i in skb_name.first..skb_name.last
  loop
    select Extract(test_xml, 'SKB/'||skb_name(i)||'/text()') into parse_str from dual;
    DBMS_OUTPUT.PUT_LINE(skb_name(i));
    DBMS_OUTPUT.PUT_LINE(parse_str.GetClobVal());
  end loop;
  --------------------------------------------
  select updatexml(test_xml, 'SKB/K/text()', 'Крутой') into test_xml from dual;
  dbms_output.put_line(test_xml.GetClobVal());
end;
