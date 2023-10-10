declare
    v_name      varchar2(20);
    v_hei       number;
    v_age       number;
    v_result    varchar2(20);
    
begin
-- 1. person 테이블에서 가장 height가 큰 사람의 이름을 출력
    select  name, height
        into    v_name, v_hei
        from    person
        where   height = (select max(height) from person);
        
    dbms_output.put_line('문제1) : ' || v_name || ' (' || v_hei || ' cm)');   

-- 2. person 테이블의 모든 행의 나이를 판별해서 per_test에 성인/미성년자를 기입
    for per in (select name, birth from person) loop
        v_age := extract(year from sysdate) - extract(year from per.birth);
        if v_age >=19 then
            v_result := '성인';
        else
            v_result := '미성년자';
        end if;
    insert into per_test values(per.name, v_age, v_result);
    commit;
    end loop;
end;



