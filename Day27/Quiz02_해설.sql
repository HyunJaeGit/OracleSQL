create or replace procedure Q1(
    p_name          varchar2
) as
    v_name      varchar2(20);
    v_birth     date;
    v_height    number;
begin
    select name, height, birth
        into v_name, v_height, v_birth
        from person
        where name = p_name;        
    
    dbms_output.put_line(v_name || ' ' || v_height || ' ' || v_birth);
end;

exec Q1('홍길동');

drop PROCEDURE Q1;
drop PROCEDURE quiz1;