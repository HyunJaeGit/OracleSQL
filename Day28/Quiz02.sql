-- 1. 절대값을 반환하는 함수

create or replace function abs(
    num      number
) return number
as
    result      number := num;
begin
    if (num<0) then
        result := num * -1;
    end if;
    
    return result;
end;


-- 2. 전달한 수를 거꾸로 만들어 반환하는 함수

create or replace function rev(
    num      number
) return number
as
    v_num       number := num;
    result      number := 0;
    v_mod       number;
begin
    while v_num > 0 loop
        v_mod := v_num mod 10;
        result := result * 10 + v_mod;
        v_num := trunc(v_num/10);
    end loop;
    
    return result;
end;

select abs(-1234) from dual;
select rev(1234) from dual;



