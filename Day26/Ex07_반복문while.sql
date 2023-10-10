-- 반복문 while

declare
    num         number := 123;
    rev         number := 0;
begin
    while num != 0 loop
        rev := rev * 10 + mod(num, 10);
        num := trunc(num/ 10);
    end loop;
    
    dbms_output.put_line('rev : ' || rev);
end;