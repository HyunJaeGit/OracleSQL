create table test_emp (
    idx         number          constraint test_emp_pk primary key,
    name        varchar2(20)    not null,
    dep_idx     number          ,
    
    constraint test_emp_fk1_dep_idx foreign key(dep_idx) references dep(idx) on delete cascade
);

-- on delete cascade = 옵션으로 생략가능
-- 이 옵션을 주면 참조 중인 열이 사라지면 현재 테이블의 데이터도 연쇄적으로 제거됨
-- ex))게시글이 사라지면 댓글도 다같이 제거

drop table test_emp;


-- 외래키 제거
alter table test_emp drop constraint test_emp_fk1_dep_idx;

-- 외래키 추가
alter table test_emp add constraint fk1_dep_idx foreign key(dep_idx) references dep(idx);






