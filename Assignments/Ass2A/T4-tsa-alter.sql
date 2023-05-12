--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-tsa-alter.sql

--Student ID: 32713339
--Student Name: Ooi Yu Zhang
--Unit Code: FIT2094
--Applied Class No: 3

/* Comments for your marker:




*/

--4(a)
/* Add column no_of_bookings to cabin table */
ALTER TABLE cabin ADD (
    no_of_bookings NUMBER(2)
);

/* Comment for new column */
COMMENT ON COLUMN cabin.no_of_bookings IS
    'Number of bookings for this cabin';

/* Display table structural change */
DESC cabin;

/* Display table before update */
SELECT * FROM cabin;

/* Update new column with total number of bookings for each cabin */
UPDATE cabin c
    SET no_of_bookings = 
        NVL((SELECT count(booking_id) FROM booking b WHERE c.resort_id = b.resort_id and c.cabin_no = b.cabin_no GROUP BY resort_id, cabin_no), 0);

COMMIT;

/* Display table after update */
SELECT * FROM cabin;

--4(b)
/* Drop table statement */
DROP TABLE staff_role CASCADE CONSTRAINTS PURGE;

/* Create new table for staff roles*/
CREATE TABLE staff_role (
    sr_id   CHAR(1)       NOT NULL,
    sr_name CHAR(50)      NOT NULL,
    sr_desc VARCHAR2(250) NOT NULL
);

/* Comments for attributes in staff role table */
COMMENT ON COLUMN staff_role.sr_id IS
    'Staff role identifier';

COMMENT ON COLUMN staff_role.sr_name IS
    'Staff role name';
    
COMMENT ON COLUMN staff_role.sr_desc IS
    'Staff role description';

/* Initialise primary key */
ALTER TABLE staff_role
    ADD CONSTRAINT staff_role_pk PRIMARY KEY (sr_id);
    
/* Insert values for staff role */
INSERT INTO staff_role VALUES (
    'A',
    'Admin',
    'Take bookings, and reply to customer inquiries'
);

INSERT INTO staff_role VALUES (
    'C',
    'Cleaning',
    'Clean cabins and maintain resort''s public area'
);

INSERT INTO staff_role VALUES (
    'M',
    'Marketing',
    'Prepare and present marketing ideas and deliverables'
);

COMMIT;
    
/* Display newly created table */
select * from staff_role;

/* Display structure of newly created table */
desc staff_role;

/* Display staff table before change */
select * from staff;

/* Display structure of staff table before change */
desc staff;

/* Add attribute to staff table */
ALTER TABLE staff ADD (
    sr_id CHAR(1)
);

/* Comment for new attribute in staff table */
COMMENT ON COLUMN staff.sr_id IS
    'Staff role identifier';
    
/* Add check constraint for staff.sr_id */
ALTER TABLE staff
    ADD CONSTRAINT chk_staff_srid CHECK (sr_id IN ('A', 'C', 'M'));

/* Add foreign key constraint for new attribute */
ALTER TABLE staff
    ADD CONSTRAINT staff_srid_fk FOREIGN KEY (sr_id)
        REFERENCES staff_role (sr_id);
        
UPDATE staff
    SET sr_id = 'A';
        
COMMIT;

/* Display table structural change for staff */
desc staff;

/* Display staff table with initialised roles */
select * from staff;

--4(c)
/* Drop table statement for cleaning table */
DROP TABLE cleaning CASCADE CONSTRAINTS PURGE;

/* Create table for cleaning */
CREATE TABLE cleaning (
    resort_id NUMBER(4) NOT NULL,
    cabin_no NUMBER(3) NOT NULL,
    staff_id NUMBER(5) NOT NULL,
    cleaning_date DATE NOT NULL,
    cleaning_start_time VARCHAR2(6) NOT NULL,
    cleaning_end_time VARCHAR2(6) NOT NULL
);

/* Comments for attributes for cleaning table */
COMMENT ON COLUMN cleaning.resort_id IS
    'Resort identifier';
    
COMMENT ON COLUMN cleaning.cabin_no IS
    'Cabin number within the resort';
    
COMMENT ON COLUMN cleaning.staff_id IS
    'Staff identifier of staff member who is in charge of cleaning';

COMMENT ON COLUMN cleaning.cleaning_date IS
    'Date cabin scheduled for cleaning';
    
COMMENT ON COLUMN cleaning.cleaning_start_time IS    
    'Start time of cleaning cabin';
    
COMMENT ON COLUMN cleaning.cleaning_end_time IS
    'End time of cleaning cabin';
    
/* Adding primary key constraint for cleaning table */
ALTER TABLE cleaning
    ADD CONSTRAINT cleaning_pk PRIMARY KEY (staff_id, resort_id, cabin_no);

/* Adding foreign key constraints for cleaning table */
ALTER TABLE cleaning
    ADD CONSTRAINT cleaning_staff_fk FOREIGN KEY (staff_id)
        REFERENCES staff (staff_id);
        
ALTER TABLE cleaning
    ADD CONSTRAINT cleaning_cabin_fk FOREIGN KEY (resort_id, cabin_no)
        REFERENCES cabin (resort_id, cabin_no);

/* Displaying cleaning table */
select * from cleaning;

/* Displaying structure of cleaning table */
desc cleaning;