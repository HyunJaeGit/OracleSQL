-- LOOP : 무한 반복

declare
    num         number := 10;
begin
    Loop
        dbms_output.put_line('num : ' || num);
        num := num -1;
        
        exit when num = 5;
    end Loop;
end;