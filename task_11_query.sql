select id, account, value, (sum(value) over (partition by account order by account, id)) as balance from d order by id;

        ID ACCOUNT                   VALUE    BALANCE
---------- -------------------- ---------- ----------
         1 01                          100        100 
         2 02                          200        200 
         3 01                         -100          0 
         4 01                          200        200 
         5 02                          100        300 
         6 01                         -100        100 
         7 01                          100        200 
         8 02                           10        310 
         9 02                           20        330 
        10 01                          -10        190 
        11 01                          -20        170 
        12 03                           10         10 
        13 03                          -10          0 
        14 01                           10        180 