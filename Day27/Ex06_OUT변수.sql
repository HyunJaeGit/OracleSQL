-- 프로시저 매개변수에서 변환할 변수를 지정 가능

create or replace procedure test4(
    n1      in      number,     -- 외부에서 프로시저로 받을(in) 변수
    n2              number,     -- 생략시 in으로 설정됨
    result  out     number      -- 프로시저에서 외부로 보낼(out) 변수
) as

begin
    result := n1 + n2;
end;

-- 다른 프로시저에서 호출

declare
    num      number;
begin
    test4(3, 5, num);       -- out 매개변수에 저장받을 변수를 지정한다
    
    dbms_output.put_line('num = ' || num);
end;


