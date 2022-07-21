SET ECHO ON

column table_name format a30

select table_name, compression, compress_for
from user_tables
where table_name IN ('CUSTOMERS', 'MYCUST_QUERY', 'MYCUST_ARCHIVE');
