-- 함수(Function) : 일정 코드를 실행 후 결과 값을 반환하는 구문

-- 프로시저 vs 함수
-- 1. 공통점
-- - 일정 길이의 코드를 저장하고 재사용
-- - 매개변수를 받아서 코드를 작성함

-- 2. 차이점
-- - 프로시저는 매개변수에 in, out을 설정 가능, 함수는 안됨
-- - 프로시저는 반환갑싱 없어도 되지만, 함수는 무조건 있어야함
-- - 프로시저는 exec 같은 구문으로 실행 (함수는 select [함수] from dual)
-- - 함수는 select 구문에서 주로 사용된다


create or replace function adder(
    n1      number,
    n2      number
) return number
as
    result      number;
begin
    result := n1 + n2;
    
    return result;
end;

select adder(10, 5) from dual;
select name, adder(idx, salary) from employee;



declare
    sal_1       number;
    sal_2       number;
    result      number;
begin
    select salary into sal_1 from employee where idx = 20230101;
    select salary into sal_2 from employee where idx = 20230102;
    
    result := adder(sal_1, sal_2);
    -- 프로시저 구문 내에서도 사용 가능
    
    dbms_output.put_line(sal_1);
    dbms_output.put_line(sal_2);
    dbms_output.put_line('결과 : ' || result);
end;








