select * from employee;
select * from emp;

-- 문제1. 모든 사원의 정보를 출력
-- 단, 부서의 정보도 같이 출력되고
-- 부서가 없는 사람은 출력x

select A.*,B.name,B.c_date,B.phone,B.email
    from emp A
    inner join dep b
    on A.dep_idx = B.idx;


-- 문제2. 모든 사원의 정보를 출력
-- 단, 부서의 정보도 같이 출력
-- 부서가 없는 사람은 출력x
-- 출력할 정보는 사원번호, 사원이름, 부서이름

select A.idx, A.name, B.name 
    from emp A 
    inner join dep B 
    on A.dep_idx = B.idx;


-- 문제3. 모든 사원의 정보를 출력
-- 단, 부서의 정보도 같이 출력
-- 부서가 없는 사람도 출력
-- 출력할 정보는 사원번호, 사원이름, 부서이름

-- full join은 너무 데이터가 많아서 안씀
select A.idx, A.name, B.name as dep_name
    from emp A 
    full join dep B 
    on A.dep_idx = B.idx
    where A.name is not null;

-- 주로 씀 (google -> ANSI조인 oracle조인 검색)
select A.idx, A.name, B.name as dep_name
    from emp A 
    left outer join dep b
    on a.dep_idx = b.idx;
    
-- 부서 없는사람만 뽑기    
select A.idx, A.name, B.name as dep_name
    from emp A 
    left outer join dep b
    on a.dep_idx = b.idx
    where a.dep_idx is null;


-- 문제4. 부서가 기술부인 모든 사원의 정보를 출력
-- 단, 부서의 정보도 같이 출력
-- 부서가 없는 사람은 출력x
-- 출력할 정보는 부서이름, 사원번호, 사원이름

-- 내 정답


-- 풀이
select B.name as dep_name, A.idx, A.name
    from emp A 
    right outer join dep b
    on A.dep_idx = B.idx
    where B.name = '기술부';

