--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T2-tsa-select.sql

--Student ID: 32713339
--Student Name: Ooi Yu Zhang
--Unit Code: FIT2094
--Applied Class No: 3

/* Comments for your marker:




*/

/*2(a)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

select town_id, town_name, poi_type_id, poi_type_descr, count(poi_id) as "POI_COUNT" from tsa.town natural join tsa.point_of_interest natural join tsa.poi_type
group by town_id, town_name, poi_type_id, poi_type_descr
having count(poi_id) > 1;

/*2(b)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

select n.member_id, n.member_gname || ' ' || n.member_fname as "MEMBER_NAME", r.resort_id, r.resort_name, count(m.member_id_recby) as "NUMBER_OF_RECOMMENDATIONS" 
from tsa.resort r join tsa.member n on r.resort_id = n.resort_id join tsa.member m on n.member_id = m.member_id_recby
group by n.member_id, n.member_gname, n.member_fname, r.resort_id, r.resort_name
having count(m.member_id_recby) =
    (select max("NUMBER_OF_RECOMMENDATIONS") 
        from ( 
            select count(m.member_id_recby) as "NUMBER_OF_RECOMMENDATIONS" 
            from tsa.member m join tsa.member n on n.member_id = m.member_id_recby
            group by n.member_id, n.member_gname, n.member_fname
             )
    )
order by r.resort_id, n.member_id;
    
/*2(c)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer



/*2(d)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


/*2(e)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer



/*2(f)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

