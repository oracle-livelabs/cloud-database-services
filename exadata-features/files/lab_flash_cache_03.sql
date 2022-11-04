SET ECHO ON

set linesize 150
column pdb_name format a10
column owner format a5
column object_name format a12
column tablespace_name format a10
column statistic_name format a30

select (select dbid from v$database) dbid,
(select name from v$pdbs) pdb_name,
owner, object_name, tablespace_name, ts#, dataobj#,
statistic_name, value
from v$segment_statistics
where owner='SH' and object_name='CUSTOMERS_FC'
and statistic_name='optimized physical reads';
