drop table board;
CREATE TABLE board (
       num number not null,
       id varchar2(10) not null,
       name varchar2(10) not null,
       subject varchar2(100) not null,
       content varchar2(500) not null,
       regist_day varchar(30),
       hit number,
       ip varchar(20),
       PRIMARY KEY (num)
);

select * from board;
desc board;
drop table board;
