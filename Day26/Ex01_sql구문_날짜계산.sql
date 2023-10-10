-- 날짜 계산

declare
    v_birth         date := '2001-05-01';
    v_cur           date := sysdate;
    v_result        number;
begin
    v_result := v_cur - v_birth;
    v_result := trunc((v_cur - v_birth) /365);

    dbms_output.put_line('hello~'); -- 디버깅
    dbms_output.put_line(v_birth);
    dbms_output.put_line(v_cur);
    dbms_output.put_line(v_result);
    
end;


declare
    v_birth         date := '2001-05-01';
    v_cur           date := sysdate;
    v_result        number;
begin
    -- 현재 날짜와 지정 날짜와의 차이 (=일(day) 수가 구해짐)
    v_result := v_cur - v_birth;
    dbms_output.put_line(v_result);
    
    -- 년도(365)로 변경
    v_result := v_result /365;
    dbms_output.put_line(v_result);
   
   -- 소수점 컷
    v_result := trunc(v_result);
    dbms_output.put_line(v_result);
    
end;