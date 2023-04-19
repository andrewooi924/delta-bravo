/*
Databases Week 7 Tutorial Class
week7_schema.sql

Author: Ooi Yu Zhang

*/

set echo on
spool week7_schema_output.txt

/* 7.2*/
/* DDL for Student-Unit-Enrolment model (using ALTER TABLE)*/
/**/

/**/
/* Place DROP commands at head of schema file*/
/**/
DROP TABLE course_unit PURGE;

DROP TABLE enrolment PURGE;

DROP TABLE student PURGE;

DROP TABLE unit PURGE;

DROP TABLE course PURGE;

/* Create Tables*/
/* Here using both table and column constraints*/
/**/

CREATE TABLE student (
    stu_nbr   NUMBER(8) NOT NULL,
    stu_lname VARCHAR2(50) NOT NULL,
    stu_fname VARCHAR2(50) NOT NULL,
    stu_dob   DATE NOT NULL
);

COMMENT ON COLUMN student.stu_nbr IS
    'Student number';

COMMENT ON COLUMN student.stu_lname IS
    'Student last name';

COMMENT ON COLUMN student.stu_fname IS
    'Student first name';

COMMENT ON COLUMN student.stu_dob IS
    'Student date of birth';

/* Add STUDENT constraints here */
ALTER TABLE student ADD (
    CONSTRAINT check_student_nbr CHECK ( stu_nbr > 10000000 ),
    CONSTRAINT student_nbr_pk PRIMARY KEY ( stu_nbr )
);

/* Add UNIT data types here */
CREATE TABLE unit (
    unit_code CHAR(7) NOT NULL,
    unit_name VARCHAR(50) NOT NULL
);

COMMENT ON COLUMN unit.unit_code IS
    'Unit code';

COMMENT ON COLUMN unit.unit_name IS
    'Unit name';

/* Add UNIT constraints here */
ALTER TABLE unit ADD (
    CONSTRAINT unique_unit_name UNIQUE ( unit_name ),
    CONSTRAINT unit_code_pk PRIMARY KEY ( unit_code )
);

/* Add ENROLMENT attributes and data types here */
CREATE TABLE enrolment (
    stu_nbr        NUMBER(8) NOT NULL,
    unit_code      CHAR(7) NOT NULL,
    enrol_year     NUMBER(8) NOT NULL,
    enrol_semester CHAR(1) NOT NULL,
    enrol_mark     NUMBER(3) NOT NULL,
    enrol_grade    CHAR(2) NOT NULL
);

COMMENT ON COLUMN enrolment.stu_nbr IS
    'Student number';

COMMENT ON COLUMN enrolment.unit_code IS
    'Unit code';

COMMENT ON COLUMN enrolment.enrol_year IS
    'Enrolment year';

COMMENT ON COLUMN enrolment.enrol_semester IS
    'Enrolment semester';

COMMENT ON COLUMN enrolment.enrol_mark IS
    'Enrolment mark (real)';

COMMENT ON COLUMN enrolment.enrol_grade IS
    'Enrolment grade (letter)';

/* Add ENROLMENT constraints here */
ALTER TABLE enrolment
ADD (CONSTRAINT stu_nbr_fk FOREIGN KEY(stu_nbr) REFERENCES student(stu_nbr),
     CONSTRAINT unit_code_fk FOREIGN KEY(unit_code) REFERENCES unit(unit_code),
     CONSTRAINT primary_key PRIMARY KEY(stu_nbr, unit_code, enrol_year, enrol_semester),
     CONSTRAINT check_enrol_semester CHECK (enrol_semester BETWEEN 0 AND 4));

spool off 
set echo off