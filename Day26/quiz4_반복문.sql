
declare
    i           number := 0;
    summary     number := 0;
    fac         number := 1;
    
begin
-- 문제1 : 1 ~ 10 까지의 합계를 출력
    while i != 10 loop
        i := i+1;
        summary := summary+i;
    end loop;
        dbms_output.put_line('문제 1) >> ' || summary);

-- 문제2 : 10 ~ 1 까지의 누적 곱(= 팩토리얼) 을 출력
    while i != 1 loop
        fac := fac*i;
        i := i-1;
    end loop;
        dbms_output.put_line('문제 2) >> ' || fac);

-- 문제3 : 6의 약수를 모두 출력
dbms_output.put('문제 3) >> ');
    while i <= 6 loop
        if mod(6, i) = 0 then
            dbms_output.put(i || ' ');
        end if;
        i := i+1;
    end loop;
    DBMS_OUTPUT.NEW_LINE;
end;

