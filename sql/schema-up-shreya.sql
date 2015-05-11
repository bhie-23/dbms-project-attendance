--Tables
CREATE TABLE  "STUDENT_DETAILS" 
   (	"STUDENT_ID" VARCHAR2(10) NOT NULL ENABLE, 
	"STUDENT_NAME" VARCHAR2(30) NOT NULL ENABLE, 
	"ADM_YEAR" NUMBER(10,0) NOT NULL ENABLE, 
	"DEPT_ID" VARCHAR2(10), 
	 CONSTRAINT "STUDENT_DETAILS_PK" PRIMARY KEY ("STUDENT_ID") ENABLE
   ) ;ALTER TABLE  "STUDENT_DETAILS" ADD CONSTRAINT "STUDENT_DETAILS_FK" FOREIGN KEY ("DEPT_ID")
	  REFERENCES  "STUDENT_DEPT" ("DEPT_ID") ENABLE;
	  
CREATE TABLE  "STUDENT_SUB" 
   (	"DEPT_ID" VARCHAR2(10), 
	"SUBJECT" VARCHAR2(30), 
	"SUB_ID" NUMBER, 
	"SUB_CODE" VARCHAR2(10), 
	 CONSTRAINT "STUDENT_SUB_PK" PRIMARY KEY ("SUB_ID") ENABLE
   ) ;ALTER TABLE  "STUDENT_SUB" ADD CONSTRAINT "STUDENT_SUB_FK" FOREIGN KEY ("DEPT_ID")
	  REFERENCES  "STUDENT_DEPT" ("DEPT_ID") ENABLE;
	  
CREATE TABLE  "STUDENT_DEPT" 
   (	"DEPT_ID" VARCHAR2(10) NOT NULL ENABLE, 
	"DEPT_NAME" VARCHAR2(10) NOT NULL ENABLE, 
	"YEAR" NUMBER(4,0) NOT NULL ENABLE, 
	"SECTION" VARCHAR2(10), 
	 CONSTRAINT "STUDENT_DEPT_PK" PRIMARY KEY ("DEPT_ID") ENABLE
   ) ;

   
CREATE TABLE  "STUDENT_TEACHERS" 
   (	"TEACHER_ID" NUMBER NOT NULL ENABLE, 
	"TEACHER_NAME" VARCHAR2(30), 
	 CONSTRAINT "STUDENT_TEACHERS_PK" PRIMARY KEY ("TEACHER_ID") ENABLE
   ) ;

CREATE OR REPLACE TRIGGER  "BI_STUDENT_TEACHERS" 
  before insert on "STUDENT_TEACHERS"               
  for each row  
begin   
  if :NEW."TEACHER_ID" is null then 
    select "STUDENT_TEACHERS_SEQ".nextval into :NEW."TEACHER_ID" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_STUDENT_TEACHERS" ENABLE;