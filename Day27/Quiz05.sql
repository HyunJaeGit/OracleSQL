
-- employee의 아무나 2명의 연봉을 가져온다
-- 그 후 앞서 ex06.sql에서 만들었던 test4() 프로시저에 두 연봉을 전달
-- 결과로 받은 값을 화면에 출력

create or replace procedure Quiz5 (
    p_idx1      number,
    p_idx2      number
) as
    v_sal1      number;
    v_sal2      number;
    v_result    number;

begin
    select salary 
        into v_sal1
        from employee  
        where idx = p_idx1;
        
    select salary 
        into v_sal2
        from employee  
        where idx = p_idx2;
   
    test4(v_sal1, v_sal2, v_result);
    
    dbms_output.put_line('연봉의 합 : ' || v_result);

end;

exec Quiz5(20230101, 20230102);