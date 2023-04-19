set echo on 
spool week7_alter_output.txt

/* Question 1 */
ALTER TABLE unit
ADD (unit_credit NUMBER(2) DEFAULT 6 NOT NULL,
    CONSTRAINT check_unit_credit CHECK (unit_credit = 3 or unit_credit = 6 or unit_credit = 12));
    
COMMENT ON COLUMN unit.unit_credit IS
    'Unit credit';
    
/* Question 2 */
CREATE TABLE course (
    course_code         CHAR(5) NOT NULL,
    course_name         VARCHAR2(50) NOT NULL,
    course_totalpoints  NUMBER(3) NOT NULL
);

COMMENT ON COLUMN course.course_code IS
    'Course code';
    
COMMENT ON COLUMN course.course_name IS
    'Course name';
    
COMMENT ON COLUMN course.course_totalpoints IS 
    'Course total points';

ALTER TABLE course
ADD CONSTRAINT course_pk PRIMARY KEY (course_code);

/* Create table for associative entity between course and unit */
CREATE TABLE course_unit (
    course_code  CHAR(5) NOT NULL,
    unit_code    CHAR(7) NOT NULL
);

COMMENT ON COLUMN course_unit.course_code IS
    'Course code';
    
COMMENT ON COLUMN course_unit.unit_code IS
    'Unit code';

ALTER TABLE course_unit
ADD (CONSTRAINT course_code_fk FOREIGN KEY (course_code) REFERENCES course(course_code),
     CONSTRAINT unit_code_fk_2 FOREIGN KEY (unit_code) REFERENCES unit(unit_code),
     CONSTRAINT course_unit_pk PRIMARY KEY (course_code, unit_code));

spool off
set echo off