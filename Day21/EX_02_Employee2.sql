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
    department   varchar2(50)   ,
    dep_create   date           ,
    dep_phone    varchar2(15)   ,
    dep_email    varchar2(150)
);

delete from employee;

-- AI로 자동 생성한 코드입니다~
-- 1번 데이터
insert into Employee (idx, name, gender, birth, h_date, phone, email, position, salary, department, dep_create, dep_phone, dep_email)
values (20230101, '홍길동', '남', '96/03/12', '23/01/01', '010-1234-5678',
        'hong@naver.com', '사원', 3000, '마케팅', '01/12/01', '02-123-5678', 'mar@naver.com');

-- 2번 데이터
insert into Employee (idx, name, gender, birth, h_date, phone, email, position, salary, department, dep_create, dep_phone, dep_email)
values (20230102, '김철수', '남', '95/08/25', '23/02/15', '010-2222-3333',
        'kim@naver.com', '대리', 4000, '영업', '00/10/05', '02-987-6543', 'kim@naver.com');

-- 3번 데이터
insert into Employee (idx, name, gender, birth, h_date, phone, email, position, salary, department, dep_create, dep_phone, dep_email)
values (20230103, '이영희', '여', '98/11/30', '23/03/22', '010-5555-6666',
        'lee@gmail.com', '사원', 3200, '인사', '03/04/15', '02-111-2222', 'lee@gmail.com');

-- 4번 데이터 (추가 예시)
insert into Employee (idx, name, gender, birth, h_date, phone, email, position, salary, department, dep_create, dep_phone, dep_email)
values (20230104, '박영수', '남', '97/07/07', '23/04/05', '010-7777-8888',
        'park@naver.com', '사원', 3000, '마케팅', '02/05/20', '02-444-5555', 'park@naver.com');

-- 5번 데이터 (추가 예시)
insert into Employee (idx, name, gender, birth, h_date, phone, email, position, salary, department, dep_create, dep_phone, dep_email)
values (20230105, '이미자', '여', '94/12/01', '23/05/10', '010-9999-0000',
        'lee@naver.com', '사원', 3000, '영업', '00/02/15', '02-666-7777', 'lee@naver.com');

-- 나머지 데이터도 위와 같이 추가로 삽입합니다.

-- 6번 데이터
insert into Employee (idx, name, gender, birth, h_date, phone, email, position, salary, department, dep_create, dep_phone, dep_email)
values (20230106, '김미영', '여', '93/04/18', '23/06/20', '010-1111-2222',
        'kimmi@gmail.com', '대리', 4200, '인사', '04/09/11', '02-333-4444', 'kimmi@gmail.com');

-- 7번 데이터
insert into Employee (idx, name, gender, birth, h_date, phone, email, position, salary, department, dep_create, dep_phone, dep_email)
values (20230107, '정준영', '남', '99/09/20', '23/07/15', '010-8888-9999',
        'jung@naver.com', '대리', 4000, '영업', '05/08/10', '02-222-3333', 'jung@naver.com');

-- 8번 데이터
insert into Employee (idx, name, gender, birth, h_date, phone, email, position, salary, department, dep_create, dep_phone, dep_email)
values (20230108, '이상화', '여', '92/06/07', '23/08/25', '010-4444-5555',
        'leesang@naver.com', '부장', 6000, '마케팅', '03/02/28', '02-111-2222', 'leesang@naver.com');

-- 9번 데이터
insert into Employee (idx, name, gender, birth, h_date, phone, email, position, salary, department, dep_create, dep_phone, dep_email)
values (20230109, '신영규', '남', '95/02/25', '23/09/11', '010-9999-8888',
        'shin@naver.com', '사원', 3200, '영업', '01/05/11', '02-777-8888', 'shin@naver.com');

-- 10번 데이터
insert into Employee (idx, name, gender, birth, h_date, phone, email, position, salary, department, dep_create, dep_phone, dep_email)
values (20230110, '윤미경', '여', '98/11/15', '23/10/02', '010-5215-6666',
        'yoon@naver.com', '사원', 3000, '인사', '95/04/24', '02-434-5355', 'kim2@naver.com');


commit;

select * from employee order by idx desc;
select * from employee order by department;


