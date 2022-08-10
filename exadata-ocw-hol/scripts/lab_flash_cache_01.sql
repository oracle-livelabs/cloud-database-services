SET ECHO ON

select a.name, b.value from v$sysstat a, v$mystat b 
where a.statistic# = b.statistic# and 
a.name in ('physical read total IO requests',
           'physical read requests optimized',
           'cell flash cache read hits');
