-- 실제 테이블에 적용해 보자~

alter table emp drop constraint emp_fk1_dep_idx;

alter table emp
    add constraint emp_fk1_dep_idx 
    foreign key(dep_idx) references dep(idx);

-- join : 관계가 있는 두 테이블을 엮어서 조회하는 방식
select * from emp order by idx;

-- 1. inner Join : 두 테이블의 겹치는 부분
select A.*, B.name, B.phone 
    from emp A 
    inner join dep B 
    on A.dep_idx = B.idx;
    
-- ※ where 구문보다 앞에 작성한다
select A.*, B.name, B.phone 
    from emp A 
    inner join dep B 
    on A.dep_idx = B.idx 
    where b.name = '생산부';    
    
-- 2. Left outer Join : 겹치는 부분과 왼쪽(A) 테이블의 모든 내용
select A.*, b.name, B.phone
    from emp A 
    left outer join dep B 
    on A.dep_idx = B.idx
    where A.dep_idx is null;    
    
-- 3. Right outer Join : 겹치는 부분과 왼쪽(A) 테이블의 모든 내용
select A.*, b.name, B.phone
    from emp A 
    right outer join dep B 
    on A.dep_idx = B.idx;
    
-- 4. Full Outer Join : 겹치는 부분과 왼쪽(A) 테이블의 모든 내용
select A.*, b.name, B.phone
    from emp A 
    full outer join dep B 
    on A.dep_idx = B.idx;
    
-- 5. Cross Join : 모든 열과 한번씩 join
select A.*, B.name, B.phone
    from emp A cross join dep B;