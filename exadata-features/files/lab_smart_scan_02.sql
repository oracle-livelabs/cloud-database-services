SET ECHO ON

select /*+ OPT_PARAM('cell_offload_processing' 'false') */
count(*) from sales
where amount_sold = 48.78;
