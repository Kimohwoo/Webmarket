drop table board;

CREATE TABLE board (
       num number not null,
       id varchar2(10 CHAR) not null,
       name varchar2(10 CHAR) not null,
       subject varchar2(100 CHAR) not null,
       content varchar2(500 CHAR) not null,
       regist_day varchar2(30 CHAR),
       hit number,
       ip varchar2(20 CHAR),
       b_id varchar2(10 CHAR) CONSTRAINT bdfk_bd_fk REFERENCES book(b_id);
       PRIMARY KEY (num)
);

select * from board;
desc board;
drop table board;
