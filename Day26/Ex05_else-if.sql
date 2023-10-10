-- pl/sql 조건문

-- else-if구문

declare
    v_age       number := 11;
    v_result    varchar(20);
    
begin
    if v_age >= 19 then
        v_result := '성인';
    elsif v_age >= 16 then          -- elseif (x) -> elsif (o)
        v_result := '고등학생';
    elsif v_age >= 13 then 
        v_result := '중학생';
    else 
        v_result := '초등학생 이하';
    end if;
        
    dbms_output.put_line('당신은 ' || v_result || '입니다');

end;