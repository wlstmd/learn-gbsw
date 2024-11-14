 CREATE TABLE TBL_REGISTER (
	NO char(1) primary key,
	name varchar(20) not null,
	code char(2),
	school char(1),
	jumin char(13),
	major varchar(20)
);

CREATE TABLE TBL_PARTNER (
	P_CODE char(2) primary key,
	P_CLASS varchar(10),
	P_RDATE date,
	P_PARTNER varchar(20) not null,
	P_TEL1 char(3),
	P_TEL2 char(4),
	P_TEL3 char(4)
);

CREATE TABLE  TBL_VOTE (
	v_jumin char(13) primary key,
	v_name varchar(20) not null,
	choice_no char(1),
	v_time char(4),
	v_area varchar(30),
	v_confirm char(1)
);

CREATE TABLE TBL_V_PEOPLE (
	jumin char(13) primary key,
	name varchar(20) not null
);