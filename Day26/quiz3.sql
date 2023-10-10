-- 1. stu_test 테이블을 생성 (idx, name, grade)

create table stu_test (
    idx             number,
    name            varchar2(20),
    grade           number,
    status          varchar2(20)
    );
-- commit;
    
-- 2. pl/sql 구문으로 학생의 성적(grade)에 따라서
-- 70 이상이면 졸업 예정, 아니면 졸업 불가를 1번 테이블에 추가

declare
    v_idx           number;
    v_name          varchar2(20);
    v_grade         varchar2(20);
    v_status        varchar2(20);
    
begin
    select      idx, name, grade
        into        v_idx, v_name, v_grade
        from        student
        where       idx = 20000101;
    
    if v_grade >= 70 then
        v_status := '졸업 예정';
    else
        v_status := '졸업 불가';
    end if;
    
    insert into stu_test values(v_idx, v_name, v_grade, v_status);
    dbms_output.put_line('성공 성공 성공!!!');
    commit;
end;

