declare
    summary     number := 0;
    fac         number := 1;
    
begin
-- 문제1 : 1 ~ 10 까지의 합계를 출력
    for i in 1..10 loop
        summary := summary + i;
    end loop;
    dbms_output.put_line('1 ~ 10 누적합 : ' || summary);
    
-- 문제2 : 10 ~ 1 까지의 누적 곱(= 팩토리얼) 을 출력
    for i in reverse 1..10 loop
        fac := fac * i;
    end loop;
    dbms_output.put_line('10~1 누적곱 : ' || fac);
    
-- 문제3 : 6의 약수를 모두 출력
     DBMS_OUTPUT.put('6의 약수 : ');
    for i in 1..6 loop
        if mod(6, i) = 0 then
            dbms_output.put(i || ' ');
        end if;
    end loop;
    dbms_output.new_line;
end;