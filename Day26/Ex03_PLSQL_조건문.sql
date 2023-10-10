-- pl/sql 조건문

declare
    v_age       number := 19;
    v_result    varchar(20) := '미성년자';
    
begin
    if v_age >= 19 then
        v_result := '성인';
    end if;
        
    dbms_output.put_line('당신은 ' || v_result || '입니다');

end;