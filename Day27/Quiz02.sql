-- 아래 구문이 실행되게 프로시저를 생성

create or replace procedure quiz1(
    p1        varchar2    
) as
    v_name      varchar2(20);
    v_birth     date;
    v_age       number;
    
     cursor cur_per is 
        select name, birth
        from person 
        where name = p1;
begin
    for per in cur_per() loop
    v_name := p1;
    v_birth := per.birth;
    v_age := extract(year from sysdate) - EXTRACT(year from per.birth);
    dbms_output.put_line('이름 : ' || v_name || '(' || v_age ||') ' || v_birth);
    end loop;
end;

exec quiz1('홍길동')