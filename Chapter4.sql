select name, course_id
from  students, takes
where student.ID = takes.ID;


select name, course_id
from student natural join takes;

select name, title
from student natural join takes, course
where takes.course_id = course.course_id;

SELECT name,title
from student natural join takes natural join course;

SELECT *
from student join takes on student_ID = takes_ID;

select * 
from student,takes
where student_ID = takes_ID;

course inner join prereq on
course.course_id = prereq.course_id

course left outer join prereq on
course.course_id = prereq.course_id

course natural right outer join prereq

course full outer join prereq using (course_id)

create view faculty AS
	SELECT ID,name,dept_name
    from instructor
    
SELECT name
FROM faculty
where dept_name = 'Biology';

create view departments_total_salary(dept_name,total_salary) as 
	SELECT dept_name , sum(salary)
    from instructor
    group by dept_name;
    
create view physics_fall_2017 as
	SELECT course.course_id,sec_id,building,room_number
    from course,section
    where course.course_id = section.course_id
    	and course.dept_name = 'Physics'
        and section.semester = 'Fall'
        and section.year = '2017'; 
        

create view physics_fall_2017_watson as
	select course_id, room_number
	from physics_fall_2017
	where building= 'Watson';

create view physics_fall_2017_watson as
    select course_id, room_number
    from (select course.course_id, building, room_number
          from course, section
          where course.course_id = section.course_id
               and course.dept_name = 'Physics'
               and section.semester = 'Fall'
               and section.year = '2017')
     where building= 'Watson';

create view instructor_info as
	select ID, name, building
	from instructor, department
	where instructor.dept_name = department.dept_name;
insert into instructor_info 
             values ('69987', 'White', 'Taylor');

create table section 
                   (course_id varchar (8),
                    sec_id varchar (8),
                    semester varchar (6),
                    year numeric (4,0),
                    building varchar (15),
                    room_number varchar (7),
                    time slot id varchar (4), 
                    primary key (course_id, sec_id, semester, year),
                    check (semester in ('Fall', 'Winter', 'Spring', 'Summer')))

create table person (
        ID  char(10),
        name char(40),
        mother char(10),
        father  char(10),
        primary key ID,
        foreign key father references person,
        foreign key mother references  person)

create type Dollars as numeric (12,2) final 

create domain person_name char(20) not NULL

create domain degree_level varchar(10)
	constraint degree_level_test
	check (value in ('Bachelors', 'Masters', 'Doctorate'));
    
create table student	
  (ID varchar (5),
   name varchar (20) not null,
   dept_name varchar (20),
   tot_cred numeric (3,0) default 0,
   primary key (ID))

create index studentID_index on student(ID)

select * 
from  student
where  ID = '12345'

