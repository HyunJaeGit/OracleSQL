
create or replace view stu_dep_pro as 
    select
        a.*, B.name as dep_name, B.d_date,
        B.phone as dep_phone, B.email as dep_email,
        C.idx as pro_idx, C.name as pro_name, C.gender as pro_gender,
        C.phone as pro_phone, C.email as pro_email
    from student A
        inner join department B on A.dep_code = B.idx
        inner join professor C on B.idx = C.dep_code
    order by A.idx;
    
select * from stu_dep_pro;
select idx, name, dep_name, pro_name from stu_dep_pro;

commit;