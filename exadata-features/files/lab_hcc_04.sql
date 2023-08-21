SET ECHO ON

create table mycust_archive 
column store compress for archive high 
parallel 4 nologging as select * from customers;
