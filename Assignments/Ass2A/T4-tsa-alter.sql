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
    no_of_bookings NUMBER(2) NOT NULL
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

/* Display table after update */
SELECT * FROM cabin;

--4(b)


        
--4(c)