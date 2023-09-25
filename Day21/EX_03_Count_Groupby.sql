-- 전체 출력
select * from employee;

update employee 
    set 
        department = null,
        dep_create = null,
        dep_phone = null,
        dep_email = null
    where idx = 20230112;
    
commit;

-- count() : 지정 행의 개수를 센다, 지정 열이 null인 행은 세지 않는다
select count(*) from employee;
select count(department) from employee;

-- group by : 특정 그룹으로 열을 묶어서 처리
-- 주로 집계 함수와 자주 사용된다
-- ※ 그룹으로 묶어서 표현 개수와 조회 하려는 개수가 다르면 에러
select department from employee group by department;
select department, count(department) from employee group by department;


-- sum() : 지정 열의 합계를 구한다
-- avg() : 지정 열의 평균을 구한다
select sum(salary), avg(salary) from employee;
select position, sum(salary), count(salary), avg(salary) from employee group by position;

-- 연습) 부서별 급여 합계/평균을 출력
select department, count(*), sum(salary) as total, avg(salary) as avg
    from employee 
    where department is not null 
    group by department
    having sum(salary) >= 10000
    order by total desc;
    
-- 위의 구문이 select의 원형. 보통 통계(= 집계)가 필요 없으면 사용되지 않음
-- having : gourp by의 조건절
-- ※ where vs having
-- 1. where : 그룹화 전에 조건을 검사. 집계 함수를 조건에 사용 불가 (= 그룹화 전이니까~)
-- 2. having : 그룹화 후에 조건을 감사. 조건에 집계 함수 사용 가능


-- min, max() : 최대 최소 집계 함수
select max(salary), min(salary) from employee;

select position, max(salary), min(salary)
    from employee
    -- where position = '사원' or position = '대리'
    where position in ('사원', '대리')
    group by position;

select * from employee;

