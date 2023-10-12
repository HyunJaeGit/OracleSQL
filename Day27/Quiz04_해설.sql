
-- 1)

begin
    update employee
        set salary = salary * ( 1 + 10/100);
end;


-- update employee set salary = salary * 1.1;
-- 반복문이 필요 없음



-- 2)

create or replace procedure q3(
    per     number
) as
begin
    update employee
        set salary = salary * ( 1 + per/100);
    
    commit;
end;

exec q3(10);

select * from employee;
rollback;

