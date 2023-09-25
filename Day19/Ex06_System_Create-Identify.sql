-- ※ 학원 실습 계정과 혼자서 연습하는 계정을 나누어 하면 비교하기 좋다
-- ※ 아래는 system 계정으로 진행한다
-- 계정 생성 및 삭제 (+ 권한 부여)

create user c##hello identified by hello;

grant dba, resource, connect to c##hello;

drop user c##gello#


-- 패스워드 변경
alter user c##itbank identify by it1234;