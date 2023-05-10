/*
Databases Week 10 Tutorial Class
week10_sql_intermediate.sql

student id: 32713339
student name: Ooi Yu Zhang
last modified date: 10/05/2023

*/

--1
select max(enrolmark) from uni.enrolment
where upper(unitcode) = upper('FIT9136') and to_char(ofyear, 'yyyy') = '2019' and ofsemester = 2;

--2
select to_char(avg(enrolmark), '990.00') as "average_mark" from uni.enrolment
where upper(unitcode) = upper('FIT2094') and to_char(ofyear, 'yyyy') = '2020' and ofsemester = 2;

--3
select to_char(avg(enrolmark), '990.00') as "average_mark" from uni.enrolment
where upper(unitcode) = upper('FIT9136')
group by ofyear, ofsemester
order by ofyear, ofsemester;

--4
-- a. 
select count(stuid) from uni.enrolment
where upper(unitcode) = upper('FIT1045') and to_char(ofyear, 'yyyy') = '2019';

-- b. Repeat students are only counted once across 2019
select count(distinct stuid) from uni.enrolment
where upper(unitcode) = upper('FIT1045') and to_char(ofyear, 'yyyy') = '2019';

--5
select count(distinct prerequnitcode) from uni.prereq
where upper(unitcode) = upper('FIT5145');

--6
select unitcode, ofsemester, count(distinct stuid) as "total_stu" from uni.enrolment
where to_char(ofyear, 'yyyy') = '2019'
group by ofsemester, unitcode
order by "total_stu", unitcode, ofsemester;

--7
select unitcode, count(distinct prerequnitcode) as "total_prereq" from uni.prereq
group by unitcode
order by unitcode;

--8
select unitcode, count(distinct stuid) as "total_wh" from uni.enrolment
where upper(enrolgrade) = upper('WH') and to_char(ofyear, 'yyyy') = '2020' and ofsemester = 2
group by unitcode
order by "total_wh" desc, unitcode;

--9
select p.prerequnitcode, u.unitname, count(p.unitcode) as "use_count"
from uni.prereq p join uni.unit u on p.prerequnitcode = u.unitcode
group by p.prerequnitcode, u.unitname
order by p.prerequnitcode;


--10
select u.unitcode, u.unitname
from uni.unit u join uni.enrolment e on u.unitcode = e.unitcode
where upper(e.enrolgrade) = upper('DEF') and to_char(e.ofyear, 'yyyy') = '2021' and e.ofsemester = 2
group by u.unitcode, u.unitname
having count(stuid) >= 2
order by u.unitcode;

--11
select stuid, stufname || ' ' || stulname as "stu_fullname", to_char(studob, 'dd-Mon-yyyy') as studob
from uni.student natural join uni.enrolment
where upper(unitcode) = upper('FIT9132') 
    and studob = (select min(studob) from uni.student natural join uni.enrolment where upper(unitcode) = upper('FIT9132'))
order by stuid;

--12
select unitcode, ofsemester, count(stuid) as "stu_num"
from uni.offering natural join uni.enrolment
where to_char(ofyear, 'yyyy') = '2019'
group by unitcode, ofsemester
having count(stuid) = 
    (select max(count(stuid)) as "stu_num" 
    from uni.offering natural join uni.enrolment
    where to_char(ofyear, 'yyyy') = '2019' 
    group by unitcode, ofsemester)
order by "stu_num" desc;

--13
select stufname || ' ' || stulname as "stu_fullname", enrolmark from uni.student natural join uni.enrolment
where upper(unitcode) = upper('FIT3157') and to_char(ofyear, 'yyyy') = '2020' and ofsemester = 1 
    and enrolmark > (select avg(enrolmark) from uni.student natural join uni.enrolment 
                        where upper(unitcode) = upper('FIT3157') and to_char(ofyear, 'yyyy') = '2020' and ofsemester = 1)
order by ofsemester, unitcode;





