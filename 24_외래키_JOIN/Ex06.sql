select idx, name, dep_idx from emp order by idx;

-- 개발부(100) 세팅
update emp set dep_idx = 100 where name = '이영희';
update emp set dep_idx = 100 where name = '이미영';
update emp set dep_idx = 100 where name = '장우진';

-- 경리부(200) 세팅
update emp set dep_idx = 200 where name = '김철수';
update emp set dep_idx = 200 where name = '천민수';

-- 기술부(300) 세팅
update emp set dep_idx = 200 where name = '김영호';
update emp set dep_idx = 200 where name = '박영수';
update emp set dep_idx = 200 where name = '박수진';

-- 총무부(400) 세팅
update emp set dep_idx = 200 where name = '왕소피아';

commit;
