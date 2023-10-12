-- 프로시저는 반환값을 가질 수 있다
-- 단, select문에서 호출은 불가능하고 보통 다른 프로시저에서 사용


select sum(salary) from employee;
-- select에서 호출되는 sum()은 프로시저가 아닌 '함수'

begin
    test();
    -- begin ~ end. 즉, 다른 프로시저 구문에서 사용되면 '저장된 프로시저'
    
    dbms_output.put_line('프로시저 실행 완료~');
end;

