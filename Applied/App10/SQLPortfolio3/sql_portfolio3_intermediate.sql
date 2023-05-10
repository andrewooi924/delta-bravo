--Comment out SET ECHO and SPOOL commands before submitting your portfolio
--SET ECHO ON
--SPOOL sql_portfolio3_intermediate_output.txt

--****PLEASE ENTER YOUR DETAILS BELOW****
--sql_portfolio3_intermediate.sql

--Student ID: 32713339
--Student Name: Ooi Yu Zhang
--Unit Code: FIT2094
--Tutorial Class No: 03


/*1*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

select tenant_no, tenant_title || '. ' || tenant_givname || ' ' || tenant_famname as "Tenant Name", count(dam_no) as "No. of Damages", to_char(sum(dam_cost), '$9990.99') as "Total Cost"
from rent.tenant natural join rent.rent natural join rent.damage
where to_char(dam_datetime, 'yyyy') = '2022'
group by tenant_no, tenant_title, tenant_givname, tenant_famname
order by "Total Cost" desc, tenant_no;

/*2*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

select tenant_no, tenant_title || '. ' || tenant_givname || ' ' || tenant_famname as "Tenant Name", prop_no, prop_address, count(rent_agreement_no) as "No. of Rental Agreements"
from rent.property join rent.rent using (prop_no) join rent.tenant using (tenant_no)
where upper(prop_address) like upper('%Tasmania')
group by tenant_no, tenant_title, tenant_givname, tenant_famname, prop_no, prop_address
having count(rent_agreement_no) > 1
order by tenant_no;

--Comment out SET ECHO and SPOOL commands before submitting your portfolio
--SPOOL OFF
--SET ECHO OFF