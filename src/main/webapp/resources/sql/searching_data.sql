CREATE TABLE searchingdata(
	id VARCHAR2(10) CONSTRAINT scdfk_id_fk REFERENCES member(id) ,
	context VARCHAR2(100)
	regdate DATE
);

SELECT * FROM searchingdata;
