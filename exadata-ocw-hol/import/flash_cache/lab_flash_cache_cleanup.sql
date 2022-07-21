SET ECHO ON

drop table customers_fc purge;

create table customers_fc as
select * from customers_org
where 1=0;

insert /*+ APPEND PARALLEL(4) */ into customers_fc
select * from customers_org;

commit;