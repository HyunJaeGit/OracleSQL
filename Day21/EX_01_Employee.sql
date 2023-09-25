create table Employee (
    idx         number          constraint Employee_idx primary key,
    name        varchar2(20)    not null,
    gender      varchar2(6)     check(gender in ('남', '여')),
    birth       date            default sysdate not null,
    h_date      date            not null,
    phone       varchar2(15)    constraint Employee_phone unique not null,
    email       varchar2(150)   constraint Employee_email unique not null,
    position    varchar2(20)    not null,
    salary      number          not null,
    department   varchar2(50)   not null,
    dep_create       date           not null,
    dep_phone    varchar2(15)   not null,
    dep_email    varchar2(150)  not null
);
select * from employee;

/*
drop table Employee;
alter table employee add idx number;
alter table employee modify idx number constraint Employee_idx primary key;
*/

create sequence employee_seq
    start with 20230101
    increment by 1
    minvalue 20000000
    maxvalue 9999999999999999999
    nocache;
    
commit;