SET ECHO ON

select /*+ PARALLEL */ count(*) from sales
where amount_sold = 48.78;