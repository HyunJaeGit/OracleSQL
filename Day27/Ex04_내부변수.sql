-- 내부 변수 설정

create or replace procedure test3 

as
    v_name          varchar2(20);
    v_height        number;
    
    cursor cur_per is select * from person;
begin
    for per in cur_per() loop
        dbms_output.put_line(per.name || ' ' || per.height);
    end loop;
end;

-- 실행
exec test3();