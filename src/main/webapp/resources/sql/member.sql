drop table member2;

create table member2 ( 
    id varchar2(10) not null,
    password varchar2(10) not null,
    name varchar2(10) not null,
    gender varchar2(4),
    birth  varchar2(10),
    mail  varchar2(30),
    phone varchar2(20),
    address varchar2(90),
    regist_day varchar2(50),    
    primary key(id) 
) ;

select * from member2;

