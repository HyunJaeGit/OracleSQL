-- 1. student 테이블 생성
create table student (
    idx         number          constraint stduent_idx primary key,
    name        varchar2(50),
    grade       number          not null,
    dep_code    number          not null,
    gender      varchar2(6)     constraint gender_check check(gender in ('남', '여')),
    birth       date            not null,
    address     varchar2(150),
    phone       varchar2(15)    constraint student_uk1_phone unique not null,
    email       varchar2(100)   constraint student_uk2_email unique not null
);

-- 2. 아차, 특정 열에 속성을 빼먹은 것을 수정
alter table student modify name varchar2(50) not null;

-- 3. 시퀀스 생성
create sequence student_seq 
    start with 20000101
    increment by 1
    minvalue 20000101
    maxvalue 999999999999999999999999
    nocache;
    
-- 4. 지정 열에 시퀀스를 기본값으로 변경
alter table student modify idx number default student_seq.nextval;

-- 5. department(전공) 테이블 생성
create table department(
    idx     number          constraint department_idx primary key,
    name    varchar2(50)    constraint department_uk1_name unique not null,
    d_date  date            not null,
    phone   varchar2(15)    constraint department_uk2_phone unique not null,
    email   varchar2(100)   constraint department_uk3_email unique not null
);

-- 6. student(dep_code) --> department(idx)를 참조하게 외래키를 지정
alter table student 
    add constraint student_fk1_dep_code 
    foreign key(dep_code) references department(idx);
