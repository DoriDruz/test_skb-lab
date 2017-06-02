with xml_type as (
      select XMLType('<SKB><S>—амый</S><K> лЄвый</K><B>Ѕанк</B></SKB>') xml
      from dual
)
select parse.xml.extract('//SKB//S//text()') S
       ,parse.xml.extract('//SKB//K//text()') K
       ,parse.xml.extract('//SKB//B//text()') B
from xml_type parse;