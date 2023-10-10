-- 1. person 테이블에서 가장 height가 큰 사람의 이름을 출력
declare
    v_name      varchar2(20);
    mx_height   number := 0;
    cursor cur_per is select * from person;
begin
    for per in cur_per() loop
        if mx_height < per.height then
            v_name := per.name;
            mx_height := per.height;
        end if;
    end loop;
    
    dbms_output.put_line(v_name || ' - ' || mx_height);
end;

-- 2. person 테이블의 모든 행의 나이를 판별해서 per_test에 성인/미성년자를 기입
declare
    v_name      varchar2(20);
    v_age       number;
    v_adult     varchar2(20);
    
    cursor cur_per is select * from person;    
begin
    for per in cur_per() loop
        v_name := per.name;
        v_age := extract(year from per.birth);
        v_age :=  extract(year from sysdate) - v_age;
    
        if v_age >= 19 then
            v_adult := '성인';
        else
            v_adult := '미성년자';
        end if;
        -- dbms_output.put_line(v_name || v_age || v_adult);
        
        insert into per_test values(v_name, v_age, v_adult);
        dbms_output.put_line('성공 성공 성공');
    end loop;
    
    commit;
end;