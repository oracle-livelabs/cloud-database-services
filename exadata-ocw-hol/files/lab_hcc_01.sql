SET ECHO ON

column segment_name format a30

select segment_name, round(sum(bytes)/1024/1024, 0) MB
from user_segments
where segment_name in ('CUSTOMERS', 'MYCUST_QUERY', 'MYCUST_ARCHIVE')
group by segment_name;
