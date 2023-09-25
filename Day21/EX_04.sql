select * from employee;

-- alias : 별칭, 연산이나 집계함수 등을 사용하면 열이름이 길어지는데 이를 줄여서 사용 가능
select count(*) as rc from employee;

-- 전체 테이블에서 합계, 최대, 최소를 구하는 Query
select sum(salary) as sum, max(salary) as max, min(salary) as min from employee;

-- 직급으로 그룹화 후 통계하고 합계로 내림차순
select position, sum(salary), max(salary), min(salary) from employee 
    group by position
    order by sum(salary) desc;

-- 부서로 그룹화 후 통게하고 합계가 1000 이상만 지정
select department, sum(salary), max(salary), min(salary) from employee 
    group by department
    having sum(salary) >= 10000;
    
commit;