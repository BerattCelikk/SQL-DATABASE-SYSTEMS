/*create table instructor (
 ID char(5),
 name varchar(20),
 dept_name varchar(20),
 salary numeric(8,2))
 */
 /*
 create table instructor2(
   ID char(5),
   name varchar(20) not null ,
   dept_name varchar(20),
   salary numeric(8,2),
   primary key (ID),
   foreign key (dept_name) REFERENCES department);
   */
   /*create table student(
     ID varchar(5),
     name varchar(20) not null ,
     dept_name varchar(20),
     tot_cred numeric(3,0),
     primary key (ID),
     foreign key (dept_name) REFERENCES department);
  */
  /*create table takes(
    ID varchar(5),
    course_id varchar(8),
    sec_id varchar(8),
    semester varchar(6),
    year numeric(4,0),
    grade varchar(2),
    primary key (ID,course_id,sec_id,semester,year),
    FOREIGN key (ID) REFERENCES student,
    foreign key (course_id,sec_id,semester,year) REFERENCES section);
    */
/*CREATE table course(
  course_id varchar(8),
  title varchar(50),
  dept_name varchar(20),
  credits numeric(2,0),
  primary key (course_id),
  FOREIGN key (dept_name) REFERENCES department);
   */
   
   --insert into instructor values('10211','Smith','Biology',66000);
   --delete from student
   
   --select name from instructor
   --select all dept_name from instructor
  -- select * from instructor
  /*select name from instructor
  where dept_name = 'Comp. Sci.' */
  
  /*
  select name 
  from instructor
  where dept_name = 'Comp. Sci.' and salary > 70000;
  */
/*
create table teaches (
 ID char(5),
 name varchar(20),
 dept_name varchar(20),
 salary numeric(8,2));*/
 
 /*select * 
 from instructor , teaches;
 */
 /*
 SELECT name , course_id
 from instructor , teaches
 where instructor.ID=teaches.ID;
 */
 
 /*
 select DISTINCT T.name
 from instructor as T , instructor as S
 where T.salary>S.salary and S.dept_name = 'Comp. Sci.'; */
 
 /*
 select name 
 from instructor 
 where name like '%dar%'; */
 
 /*
 SELECT DISTINCT name
 from instructor
 order by name;*/

/*
select name 
from instructor
where salary BETWEEN 90000 and 100000;*/

/*
select name,course_id
from instructor , teaches
WHERE(instructor.ID,dept_name) = (teaches.ID,'Biology');
*/

/*
select course.id from section where sem = 'Fall' and year=2017
UNION
select course.id from section where sem = 'Spring' and year=2018;
*/ 
-- Union = shows fall and spring sections if they have same sections,shows once.

/*
select course.id from section where sem = 'Fall' and year=2017
INTERSECT
select course.id from section where sem = 'Spring' and year=2018;
*/ 

--intersect = shows common courses found in both lists .

/*
select course.id from section where sem = 'Fall' and year=2017
EXCEPT
select course.id from section where sem = 'Spring' and year=2018;
*/ 
--except : Fall section - spring section => special fall sections .

/*
SELECT name 
from instructor
where salary is NULL; */

/*
SELECT avg(salary)
from instructor
where dept_name = 'Comp. Sci.';
*/

/*
select count(DISTINCT ID)
from teaches
where semester = 'Spring' and year = 2018;
*/

/*
select count(*)
from course;
*/

/*
select dept_name avg(salary) as avg_salary
from instructor
GROUP BY dept_name;
*/
/*
select dept_name,ID,avg(salary)
from instructor
GROUP by dept_name;
*/

/*
SELECT dept_name , avg(salary) as avg_salary
from instructor
GROUP BY dept_name
HAVING avg(salary) > 42000;
*/

/*
select DISTINCT course_id
from section
where semester = 'Fall' and year=2017 and course_id in (SELECT course_id 
                                                        from section
                                                        where semester = 'Spring' and year = 2018);*/
                                                       
   /*
SELECT DISTINCT course_id
from section
where semester = 'Fall' and year = 2017 and 
	course_id not in (select course_id 
                      from section
                      where semester = 'Spring' and year = 2018);
                      */

/*
select DISTINCT name
FROM instructor
where name not in ('Mozart' , 'Einstein');
*/

/*
select count(DISTINCT ID)
from takes
where(course_id,sec_id,semester,year) in 
	(select course_id,sec_id,semester,year 
     from teaches
     where teaches.ID=10101);
     */

/*
select DISTINCT T.name
from instructor as T,instructor as S
where T.salary > S.salary and S.dept_name = 'Biology';
*/

/*
select name 
from instructor
where salary>some(select salary
                  from instructor
                  where dept_name = 'Biology');
                  */
/*           
select name
from instructor
where salary > all(select salary 
                   from instructor
                   where dept_name='Biology'); */

/*                   
select course_id
from section as S
where semester = 'Fall' and year = 2017 AND
	EXISTS(SELECT *
           from section as T
           where semester = 'Spring' and year = 2018
           		and S.course_id = T.course_id);
                
                */
                
/*
select distinct S.ID, S.name
from student as S
where not exists ( (select course_id
 from course
 where dept_name = 'Biology')
 except
 (select T.course_id
 from takes as T
 where S.ID = T.ID));
*/

/*
select T.course_id
from course as T
where UNIQUE (SELECT R.course_id
              from section as R
              where T.course_id = R.course_id
             	and R.year= 2017);
*/

/*
select dept_name , avg_salary
from(select dept_name,avg(salary) as avg_salary
     from instructor
     GROUP by dept_name)
where avg_salary>42000;
*/

/*
select dept_name,avg_salary
from (SELECT dept_name,avg(salary)
      from instructor
      GROUP by dept_name)
      as dept_avg (dept_name,avg(salary)
where avg_salary > 42000;
*/

/*
with max_budget(value) as 
	(select max(budget)
     from department)
select department.name
from department,max_budget
where department.budget = max_budget.value;
*/

/*
with dept_total(dept_name,value) as 
	(select dept_name , sum(salary)
     from instructor
     GROUP by dept_name),
dept_total_avg(value) as 
	(select avg(value)
     from dept_total)
select dept_name
from dept_total,dept_total_avg
where dept_total.value > dept_total_avg.value;

*/

/*
select dept_name,
 ( select count(*)
 from instructor
 where department.dept_name = instructor.dept_name)
 as num_instructors
from department;
*/

/*
delete from instructor
where dept_name= 'Finance’;
*/

/*
delete from instructor
 where dept_name in (select dept_name
 from department
where building = 'Watson');
*/

/*
delete from instructor
where salary < (select avg (salary)
 from instructor);
*/

/*
insert into course
 values ('CS-437', 'Database Systems', 'Comp. Sci.', 4);
 */

/*
insert into course (course_id, title, dept_name, credits)
 values ('CS-437', 'Database Systems', 'Comp. Sci.', 4);
*/

/*
insert into student
 values ('3003', 'Green', 'Finance', null);
*/

/*
insert into instructor
select ID, name, dept_name, 18000
 from student
 where dept_name = 'Music' and total_cred > 144;
*/

/*
update instructor
 set salary = salary * 1.05
*/

/*
update instructor
 set salary = salary * 1.05
 where salary < 70000;
*/

/*
update instructor
 set salary = salary * 1.05
 where salary < (select avg (salary)
 from instructor);
*/

/*
update instructor
 set salary = salary * 1.03
 where salary > 100000;
 update instructor
 set salary = salary * 1.05
 where salary <= 100000;
*/

/*
update instructor
 set salary = case
 	when salary <= 100000 then salary * 1.05
 	else salary * 1.03
 	end
*/

/*
update student S
 set tot_cred = (select sum(credits)
 from takes, course
 where takes.course_id = course.course_id and
 S.ID= takes.ID.and
 takes.grade <> 'F' and
 takes.grade is not null);
*/