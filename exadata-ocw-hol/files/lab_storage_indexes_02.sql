SET ECHO ON

select cust_gender, count(*) from customers
where cust_income_level = 'C: 50,000 - 69,999'
group by cust_gender;
