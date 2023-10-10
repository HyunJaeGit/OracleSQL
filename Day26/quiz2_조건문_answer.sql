-- person테이블에서 한 사람의 이름과 생일을 가져와서 성인/미성년자로 구분해서 출력

CREATE TABLE per_test (
    name VARCHAR2(20),
    age NUMBER,
    adult VARCHAR2(20)
);

commit;

DECLARE
    v_name      VARCHAR2(20);
    v_age       number;
    v_adult     varchar2(20) := '미성년자';
BEGIN
    SELECT  NAME, extract(year from birth)
            INTO v_name, v_age
        FROM person
        WHERE name = '박민수';
    
    v_age := extract(year from sysdate) - v_age;
    
    if v_age >= 19 then
        v_adult := '성인';
    else 
        v_adult := '미성년자'; 
    end if;
    
    insert into per_test values(v_name, v_age, v_adult);
        
    dbms_output.put_line('insert 성공~');
END;

commit;
