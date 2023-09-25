select banner from v$version;

select * from person;

select * from account;
commit;

update account
    set userpw = '1234567'
    where userpw = '123456';
    
commit;