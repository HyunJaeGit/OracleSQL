-- person테이블에서 한 사람의 이름과 생일을 가져와서 성인/미성년자로 구분해서 출력

DECLARE
    v_name      VARCHAR2(20);
    v_birth     date;
    v_age       number;
    v_result    varchar2(20);
BEGIN
    SELECT  NAME, birth
        INTO v_name, v_birth
        FROM person
        WHERE name = '김민지';
    
    v_age := trunc((sysdate - v_birth)/365); 
    DBMS_OUTPUT.PUT_LINE(v_name || '님은 ' || v_age || '세 입니다');
    
    if v_age >= 19 then
        v_result := '성인';
    else 
        v_result := '미성년자'; 
    end if;
        
    dbms_output.put_line('당신은 ' || v_result || '입니다');
END;