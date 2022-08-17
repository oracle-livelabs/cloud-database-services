SET ECHO ON

select a.name, round(b.value/1024/1024, 0) MB 
from v$sysstat a, v$mystat b
where a.statistic# = b.statistic# and
a.name in ('physical read total bytes',
            'cell IO uncompressed bytes',
            'cell physical IO interconnect bytes',
            'cell physical IO bytes eligible for predicate offload',
            'cell physical IO interconnect bytes returned by smart scan');
