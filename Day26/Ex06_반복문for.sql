-- 반복문 for


begin
    for i in 1..10 loop                 -- i 는 for문 내부에서 사용가능
        dbms_output.put_line(i || ' : Hello, world!!!');
    end loop;
    
    for i in reverse 1..10 loop         -- reverse를 주면 역순으로 반복
        dbms_output.put_line(i || ' : Hello, Oracle!!!');
    end loop;
    
end;