--Comment out SET ECHO and SPOOL commands before submitting your portfolio
--SET ECHO ON
--SPOOL sql_portfolio2_basic_output.txt

--****PLEASE ENTER YOUR DETAILS BELOW****
--sql_portfolio2_basic.sql

--Student ID: 32713339
--Student Name: Ooi Yu Zhang
--Unit Code: FIT2094
--Tutorial Class No: 3


/*1*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
select maint_id, to_char(maint_datetime, 'dd-Mon-yyyy') as "MAINT_DATETIME", prop_address, owner_givname || ' ' || owner_famname as "OWNER_NAME", maint_desc, maint_cost
from rent.owner natural join rent.property natural join rent.maintenance
where maint_cost > 1000 and maint_cost < 3000 and upper(maint_assigned) = 'Y'
order by maint_cost desc, maint_datetime;



/*2*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer




--Comment out SET ECHO and SPOOL commands before submitting your portfolio
--SPOOL OFF
--SET ECHO OFF