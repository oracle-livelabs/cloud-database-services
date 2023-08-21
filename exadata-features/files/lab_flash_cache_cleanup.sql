SET ECHO ON

drop table customers_fc purge;

create table customers_fc as
select * from customers_org
where 1=0;

INSERT /*+ APPEND PARALLEL(4) */ INTO customers_fc
SELECT * FROM customers_org;

commit;