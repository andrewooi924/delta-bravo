--Comment out SET ECHO and SPOOL commands before submitting your portfolio
SET ECHO ON
SPOOL sql_portfolio2_basic_output.txt

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
from rent.owner 
    natural join rent.property 
    natural join rent.maintenance
where 
    maint_cost between 1000 and 3000
    and upper(maint_assigned) = 'Y'
order by maint_cost desc, to_date(maint_datetime, 'dd-Mon-yyyy') desc;

/*2*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
select r.rent_agreement_no, r.tenant_no, t.tenant_title || '. ' || t.tenant_givname || ' ' || t.tenant_famname as "TENANT_NAME", p.prop_address, o.owner_givname || ' ' || o.owner_famname as "OWNER_NAME", r.rent_lease_period || ' months' as "RENT_LEASE_PERIOD"
from rent.tenant t 
    join rent.rent r on t.tenant_no = r.tenant_no
    join rent.property p on p.prop_no = r.prop_no
    join rent.owner o on o.owner_no = p.owner_no
where
    to_char(r.rent_lease_start, 'yyyy') = '2022'
    and r.rent_weekly_rate < 425
    and r.rent_lease_period >= 6
order by r.rent_lease_period desc, r.tenant_no;

--Comment out SET ECHO and SPOOL commands before submitting your portfolio
SPOOL OFF
SET ECHO OFF