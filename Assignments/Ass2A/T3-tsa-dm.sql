--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-tsa-dm.sql

--Student ID: 32713339
--Student Name: Ooi Yu Zhang
--Unit Code: FIT2094
--Applied Class No: 3

/* Comments for your marker:




*/

---**This command shows the outputs of triggers**---
---**Run the command before running the insert statements.**---
---**Do not remove**---
SET SERVEROUTPUT ON
---**end**---

--3(a)
DROP SEQUENCE booking_seq;
CREATE SEQUENCE booking_seq START WITH 100 INCREMENT BY 10;
--3(b)
INSERT INTO cabin VALUES (
    (SELECT resort_id FROM resort WHERE upper(resort_name) = upper('Awesome Resort') 
        and town_id = (select town_id from town where upper(town_name) = upper('Broome'))),
    4,
    4,
    10,
    'I',
    220,
    'This cabin has 4 bedrooms with a sleeping capacity of 10 people, an inside cabin bathroom and costs 220 points per day.'
);

COMMIT;

--3(c)
INSERT INTO booking VALUES (
    booking_seq.NEXTVAL,
    (SELECT resort_id FROM resort WHERE upper(resort_name) = upper('Awesome Resort') 
        and town_id = (select town_id from town where upper(town_name) = upper('Broome'))),
    4,
    TO_DATE('26-May-2023', 'dd-Mon-yyyy'),
    TO_DATE('28-May-2023', 'dd-Mon-yyyy'),
    4,
    4,
    440,
    (SELECT member_id from member where member_no = 2 and resort_id = 9),
    (SELECT staff_id from staff where upper(staff_gname) = upper('Reeba') and upper(staff_fname) = upper('Wildman') and staff_phone = '0493427245')
);

COMMIT;

--3(d)
UPDATE booking
    SET booking_to = booking_to + 1,
        booking_total_points_cost = booking_total_points_cost + 
        (SELECT cabin_points_cost_day from cabin
            WHERE resort_id = (SELECT resort_id FROM resort WHERE upper(resort_name) = upper('Awesome Resort') 
                and town_id = (SELECT town_id FROM town WHERE upper(town_name) = upper('Broome')))
                and cabin_no = 4)
WHERE 
    resort_id = (SELECT resort_id FROM resort WHERE upper(resort_name) = upper('Awesome Resort') 
        and town_id = (SELECT town_id FROM town WHERE upper(town_name) = upper('Broome')))
    and cabin_no = 4
    and booking_from = TO_DATE('26-May-2023', 'dd-Mon-yyyy');

COMMIT;

--3(e)
DELETE FROM booking
    WHERE resort_id = (SELECT resort_id FROM resort WHERE upper(resort_name) = upper('Awesome Resort') 
        and town_id = (SELECT town_id FROM town WHERE upper(town_name) = upper('Broome')))
        and cabin_no = 4;
        
DELETE FROM cabin
    WHERE resort_id = (SELECT resort_id FROM resort WHERE upper(resort_name) = upper('Awesome Resort') 
        and town_id = (SELECT town_id FROM town WHERE upper(town_name) = upper('Broome')))
        and cabin_no = 4;

COMMIT;