select * from test_student;

select * from test_stu_view;

select * from test_stu_view order by total desc;

create table test (
    gender varchar2(6) constraint test_gender check(gender in ('남', '여'))
);

drop table test;

insert into test values('남');
insert into test values('여');
insert into test values('뭐');
insert into test values('물');
insert into test values('?');
insert into test values(null);

select * from test;



