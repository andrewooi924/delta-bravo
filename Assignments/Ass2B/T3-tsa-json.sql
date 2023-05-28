--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-tsa-json.sql

--Student ID: 32713339
--Student Name: Ooi Yu Zhang
--Unit Code: FIT2094
--Applied Class No: 3

/* Comments for your marker:




*/

/*3(a)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT TO GENERATE 
-- THE COLLECTION OF JSON DOCUMENTS HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    JSON_OBJECT ( '_id' VALUE town_id, 
                  'name' VALUE town_name || ' ' || town_state,
                  'location' VALUE JSON_OBJECT (
                                'latitude' VALUE town_lat,
                                'longitude' VALUE town_long),
                  'avg_temperature' VALUE JSON_OBJECT (
                                'summer' VALUE town_avg_summer_temp,
                                'winter' VALUE town_avg_winter_temp),
                  'no_of_resorts' VALUE count(resort_id),
                  'resorts' VALUE JSON_ARRAYAGG(JSON_OBJECT(
                                '_id' VALUE resort_id,
                                'name' VALUE resort_name,
                                'address' VALUE resort_street_address,
                                'phone' VALUE resort_phone,
                                'year_built' VALUE resort_yr_built_purch,
                                'company_name' VALUE company_name))
    FORMAT JSON )
    || ','
FROM
    tsa.town
    NATURAL JOIN tsa.resort
    NATURAL JOIN tsa.company
GROUP BY
    town_id,
    town_name,
    town_state,
    town_lat,
    town_long,
    town_avg_summer_temp,
    town_avg_winter_temp,
    resort_id,
    resort_name,
    resort_street_address,
    resort_phone,
    resort_yr_built_purch,
    company_name
ORDER BY
    town_id;
