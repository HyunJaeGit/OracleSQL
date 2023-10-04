create table dep (
    idx     number,
    name    varchar2(50)    constraint uk_name unique not null,
    c_date  date            not null,
    phone   varchar2(15)    constraint uk_phone unique not null,
    email   varchar2(150)   constraint uk_email unique not null
);

-- distinct : 중복되는 행은 한번만
insert into dep(name, c_date, phone, email)
    select distinct
        department, dep_create, dep_phone, dep_email
        from employee 
        where department is not null
        order by department;
        
select * from dep order by name;

-- dep 테이블 idx를 기입하자 100 ~ 400
update dep set idx = 100 where name = '개발부';
update dep set idx = 200 where name = '경리부';
update dep set idx = 300 where name = '기술부';
update dep set idx = 400 where name = '총무부';

commit;

-- idx에 null 값 에러 때문에 지정하지 않은 pk를 지정하자
alter table dep add constraint dep_idx primary key(idx);




