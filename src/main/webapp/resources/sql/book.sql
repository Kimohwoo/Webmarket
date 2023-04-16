DROP TABLE book;

CREATE TABLE book(
    b_id VARCHAR2(10 CHAR) CONSTRAINT bkpk_bid_pk PRIMARY KEY,
    b_name VARCHAR2(50 CHAR),
    b_author VARCHAR2(10 CHAR),
    b_publisher VARCHAR2(10 CHAR),
    b_reg DATE,
    b_price NUMBER,
    b_filename VARCHAR2(20 CHAR),
    b_description VARCHAR2(500 CHAR)
);

SELECT * FROM book;