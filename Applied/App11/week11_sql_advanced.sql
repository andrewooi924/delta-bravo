/*
Databases Week 11 Tutorial Class
week11_sql_advanced.sql

student id: 32713339
student name: Ooi Yu Zhang
last modified date: 17-05-2023

*/
--1
select unitcode as "UNITCODE", unitname as "UNITNAME", to_char(ofyear, 'yyyy') as "YEAR", ofsemester as "OFSEMESTER", enrolmark as "ENROLMARK", 
case enrolgrade
when 'N' then 'Fail'
when 'P' then 'Pass'
when 'C' then 'Credit'
when 'D' then 'Distinction'
when 'HD' then 'High Distinction'
end as "EXPLAINED_GRADE"
from uni.student natural join uni.enrolment natural join uni.unit 
where upper(stufname) = upper('Claudette') and upper(stulname) = upper('Serman')
order by ofyear, ofsemester, unitcode;

--2
select staffid, stafffname, stafflname, ofsemester, count(clno) as "NUMBERCLASSES", 
case
when count(clno) > 2 then 'Overload'
when count(clno) = 2 then 'Correct load'
else 'Underload'
end as "LOAD"
from uni.staff natural join uni.schedclass
where to_char(ofyear, 'yyyy') = '2019'
group by staffid, stafffname, stafflname, ofsemester
order by "NUMBERCLASSES" desc, staffid, ofsemester;


--3
select unitcode, count(prerequnitcode) as "NO_OF_PREREQ" from uni.unit natural left join uni.prereq
group by unitcode
order by "NO_OF_PREREQ" desc, unitcode;


--4

/* Using outer join */
select unitcode, unitname from uni.unit natural left join uni.prereq
group by unitcode, unitname
having count(prerequnitcode) = 0;


/* Using set operator MINUS */
select unitcode, unitname from uni.unit
where unitcode in (
select unitcode from uni.unit
minus
select unitcode from uni.prereq);


/* Using subquery */
select unitcode, unitname
from uni.unit
where unitcode not in (select unitcode from uni.prereq);


--5
select unitcode, ofsemester, count(unitcode) as "NO_OF_ENROLMENT", lpad(to_char(nvl(avg(enrolmark), 0), 990.99), 20, ' ') as "AVERAGE_MARK" from uni.offering natural left join uni.enrolment
where to_char(ofyear, 'yyyy') = '2019'
group by unitcode, ofsemester
order by "AVERAGE_MARK", ofsemester, unitcode;


--6
select unitcode, unitname, stafffname || ' ' || stafflname as ce_name
from uni.unit natural join uni.staff natural join uni.offering natural left join uni.enrolment 
where to_char(ofyear, 'yyyy') = '2019' and ofsemester = 2
group by unitcode, unitname, stafffname, stafflname
having count(stuid) = 0
order by unitcode;


--7
select stuid, stufname || ' ' || stulname as student_full_name
from uni.student natural join uni.enrolment natural join uni.unit
where to_char(ofyear, 'yyyy') = 2020 and ofsemester = 1 and upper(unitname) = upper('Introduction to databases')
intersect
select stuid, stufname || ' ' || stulname as student_full_name
from uni.student natural join uni.enrolment natural join uni.unit
where to_char(ofyear, 'yyyy') = 2020 and ofsemester = 1 and upper(unitname) = upper('Introduction to computer architecture and networks')
order by stuid;

--8
select staffid, stafffname || ' ' || stafflname as "staffname", 'Lecture' as "type", count(clno) as "NO_OF_CLASSES", sum(clduration) as "TOTAL_HOURS", lpad(to_char((sum(clduration) * 75.60), '$900.00'), 15, ' ') as "weekly_payment" 
from uni.staff natural join uni.schedclass
where to_char(ofyear, 'yyyy') = '2020' and ofsemester = 1 and cltype = 'L'
group by staffid, stafffname, stafflname, cltype, clduration
union
select staffid, stafffname || ' ' || stafflname as "staffname", 'Tutorial' as "type", count(clno) as "NO_OF_CLASSES", sum(clduration) as "TOTAL_HOURS", lpad(to_char((sum(clduration) * 42.85), '$900.00'), 15, ' ') as "weekly_payment" 
from uni.staff natural join uni.schedclass
where to_char(ofyear, 'yyyy') = '2020' and ofsemester = 1 and cltype = 'T'
group by staffid, stafffname, stafflname, cltype, clduration
order by staffid, "type"

    
--9
select distinct s.staffid, stafffname || ' ' || stafflname as staffname, 
lpad(to_char(nvl((select sum(clduration) * 42.85 from uni.schedclass sc1 where sc1.staffid = sc.staffid and cltype = 'T' and ofsemester = 1 and to_char(ofyear, 'yyyy') = 2020), 0), '$990.99'), 15, ' ') as tutorial_payment,
lpad(to_char(nvl((select sum(clduration) * 75.60 from uni.schedclass sc1 where sc1.staffid = sc.staffid and cltype = 'L' and ofsemester = 1 and to_char(ofyear, 'yyyy') = 2020), 0), '$990.99'), 15, ' ') as lecture_payment,
lpad(to_char(nvl((select sum(clduration) * 42.85 from uni.schedclass sc1 where sc1.staffid = sc.staffid and cltype = 'T' and ofsemester = 1 and to_char(ofyear, 'yyyy') = 2020), 0) + nvl((select sum(clduration) * 42.85 from uni.schedclass sc1 where sc1.staffid = sc.staffid and cltype = 'L' and ofsemester = 1 and to_char(ofyear, 'yyyy') = 2020), 0), '$990.99'), 20, ' ') as total_weekly_payment
from uni.staff s join uni.schedclass sc on s.staffid = sc.staffid
order by staffid;

--10
select stuid, stufname || ' ' || stulname as student_fullname, unitcode, enrolmark, enrolgrade
from uni.student natural join uni.enrolment
order by stuid;

select stuid, stufname || ' ' || stulname as student_fullname, 
sum(case
        when)
from uni.student natural join uni.enrolment





