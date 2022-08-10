SET ECHO ON

create table mycust_query
column store compress for query high
parallel 4 nologging as select * from customers;
