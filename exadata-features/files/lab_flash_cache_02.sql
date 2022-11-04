SET ECHO ON
SET SERVEROUTPUT ON

declare
  a number;
  s number := 0;
begin
  for n in (select cust_id from customers_fc) loop
    if mod(n.cust_id, 200) = 0 then
      select cust_credit_limit
        into a
        from customers_fc
        where cust_id=n.cust_id
        and rownum < 2;
    end if;
    s := s+a;
  end loop;
  dbms_output.put_line('Transaction total = '||s);
end;
/
