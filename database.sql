-- brands, cars, extras
-- majors:students
--			1 majors:N students; 1 student:1 major ==> 1:N
-- students:courses
--			NO RELATION
-- courses:majors
--			1 major:N courses; 1 course:N majors ==> N:M
-- majors, students, courses, con_stu_major

-- con_stu_major -> students
-- con_stu_major -> majors
-- courses -> majors
-- CREATE: majors, students, courses, con_stu_major
-- DROP: majors, students, courses, con_stu_major




IF object_id('courses', 'U') is not null DROP TABLE courses; -- Drop existing table
IF object_id('con_stu_major', 'U') is not null DROP TABLE con_stu_major;
IF object_id('major', 'U') is not null DROP TABLE major;
IF object_id('student', 'U') is not null DROP TABLE student;
GO

CREATE TABLE student ( --create table student
	stu_id int primary key, --unique id of the table
	stu_name nvarchar(200),
	stu_roll int,
	stu_gender nvarchar(200),
	stu_email nvarchar(200),
	stu_address nvarchar(200),
	stu_birthyear int
);

CREATE TABLE major ( --create table major
	major_id int primary key, --unique id
	major_name nvarchar(200) not null,
	major_description nvarchar(1500),
	major_head nvarchar(200),
	major_department nvarchar(200),
	major_building nvarchar(200)
);
CREATE TABLE con_stu_major ( -- create connector table
	conn_id int identity primary key, --unique id
	conn_studId int references student(stu_id), --foreign key reference to stu_id in student table
	conn_major_id int references major(major_id) --foreign key reference to major_id in major table
	-- CONSTRAINT uq_conn UNIQUE (conn_car, conn_extra)
);
CREATE TABLE courses ( --create table courses
	courses_id int primary key, --unique id
	course_size int,
	course_name nvarchar(200),
	course_teacher nvarchar(200),
	course_textbook nvarchar(200),
	course_day nvarchar(200),
	course_schedule nvarchar(200),
	course_room int,
	major_id int references major(major_id) --foreign key reference to major id in major table
);
GO
INSERT INTO student VALUES (1, 'Vishav Lakhtia',2001,'Male','vishav676@gmail.com','India',1999); -- insert values in student table
INSERT INTO student VALUES (2, 'Priya Jindal',2002,'Female','priyajindal0900@gmail.com','London',1999);
INSERT INTO student VALUES (3, 'Sargam Sharma',2003,'Female','sargam@gmail.com','Canada',2001);
INSERT INTO student VALUES (4, 'Piyush Goyal',2004,'Male','pgoyal895@gmail.com','Hungary',1998);
INSERT INTO student VALUES (5, 'Sanampreet Singh',2005,'Male','sanampreet0900@gmail.com','USA',2000);
INSERT INTO student VALUES (6, 'Ayesha Farooqi',2006,'Female','ayesha@gmail.com','Australia',1995);
INSERT INTO student VALUES (7, 'Dilkhush Lakhtia',2007,'Male','khush3311@gmail.com','Canada',1992);
INSERT INTO student VALUES (8, 'Kevin',2002,'Male','kkevin@gmail.com','Hungary',1999);
INSERT INTO student VALUES (9, 'Ashutosh',2009,'Male','ashu095@gmail.com','Germany',2001);
INSERT INTO student VALUES (10, 'Somanshu',2010,'Male','sgoyal@gmail.com','Swizterland',2002);


INSERT INTO major VALUES (1, 'Software design and Development','develop softwares','Bill Gates','Department of Electrical and Infomartion','A'); --insert values in major table
INSERT INTO major VALUES (2, 'Electrical Engineering','Build','Tim Crook','Department of Electrical and Infomartion','A');
INSERT INTO major VALUES (3, 'Cybersecurity','Cybersecurity is the practice of protecting systems, networks, and programs from digital attacks','Steve Jobs','Department of Electrical and Infomartion','A');
INSERT INTO major VALUES (4, 'Artificial Intelligence','Artificial intelligence (AI) is the simulation of human intelligence processes by machines, especially computer systems.','Elon Musk','Department of Electrical and Infomartion','A');
INSERT INTO major VALUES (5, 'Physiotherphy','Physiotherapists help people affected by injury, illness or disability through movement and exercise, manual therapy, education and advices','Judit Kiss','Department of Health Science','D');
INSERT INTO major VALUES (6, 'International Business Economics','The International Business and Economics Program provides students with an understanding of the rapidly changing global economy','Warren Buffet','Department of Business Management and Economics','B');
INSERT INTO major VALUES (7, 'Cloud Computing','Cloud computing is the on-demand availability of computer system resources, especially data storage and computing power, without direct active management by the user','Sundar Pichai','Department of Electrical and Infomartion','A');
INSERT INTO major VALUES (8, 'Civil Engineering','Civil engineering is a professional engineering discipline that deals with the design, construction, and maintenance of the physical and naturally built environment','Gabor Hovarth','Department of Engineering','C');
INSERT INTO major VALUES (9, 'Mechanical Engineering','Mechanical engineering is the discipline that applies engineering physics, engineering mathematics, and materials science principles to design, analyze, manufacture, and maintain mechanical systems','Vilmos', 'Department of Engineering','C');
INSERT INTO major VALUES (10, 'Chemical Engineering','Chemical engineering is a branch of engineering that uses principles of chemistry, physics, mathematics, biology,','Rita','Department of Engineering','C');


INSERT INTO con_stu_major (conn_studId, conn_major_id) VALUES (1, 1); --insert values in connector table
INSERT INTO con_stu_major (conn_studId, conn_major_id) VALUES (2, 5);
INSERT INTO con_stu_major (conn_studId, conn_major_id) VALUES (3, 6);
INSERT INTO con_stu_major (conn_studId, conn_major_id) VALUES (4, 3);
INSERT INTO con_stu_major (conn_studId, conn_major_id) VALUES (5, 4);
INSERT INTO con_stu_major (conn_studId, conn_major_id) VALUES (6, 7);
INSERT INTO con_stu_major (conn_studId, conn_major_id) VALUES (7, 9);
INSERT INTO con_stu_major (conn_studId, conn_major_id) VALUES (8, 10);
INSERT INTO con_stu_major (conn_studId, conn_major_id) VALUES (9, 2);
INSERT INTO con_stu_major (conn_studId, conn_major_id) VALUES (10, 8);


INSERT INTO courses VALUES (1, 30,'Java','Munit','Basic of Java','Monday','8:30am-10:30am',201,1);--insert value in courses table
INSERT INTO courses VALUES (2, 50,'Mechanics','Armino','Basic of mechanical Eng.','Tuesday','10:30am-12:30am',212,9);
INSERT INTO courses VALUES (3, 60,'Chemistry','Szabo','Basic of chemical Eng.','Wednesday','4:30pm-6:30pm',210,10);
INSERT INTO courses VALUES (4, 25,'Anatomy','R.D Sharma','Basic of physiotherphy.','Friday','8:30am-10:30am',205,5);
INSERT INTO courses VALUES (5, 30,'Mathematics','Alexndra','Basic of civil eng','Thursday','10:30am-12:30pm',202,8);
INSERT INTO courses VALUES (6, 40,'Machine Learning','Barbra','Basic of artifical intelligence.','Monday','1:30pm-3:30pm',204,4);
INSERT INTO courses VALUES (7, 80,'Security','Kohari','Basic of CyberSecurity.','Wednesday','12:30pm-2:30pm',209,3);
INSERT INTO courses VALUES (8, 35,'Business Management','Luzajo','Economics studies.','Thurday','4:30pm-6:30pm',207,6);
INSERT INTO courses VALUES (9, 45,'Cloud Computing','Peter','Basic of cloud computing','Friday','10:30am-12:30pm',208,7);
INSERT INTO courses VALUES (10, 50,'Digital Design','Danil','Basic of electrical','Tuesday','8:30am-10:30am',211,2);

-- TO show the data of the tables
SELECT * FROM courses;
SELECT * FROM con_stu_major;
SELECT * FROM major;
SELECT * FROM student;

-- 3 Single select tables
-- Query 1
SELECT stu_name,stu_birthyear
FROM student; --show the table with the student name and birthyear

--Query 2
select stu_name, len(stu_name)
as [Length of the Student name]
from student; -- shows the student name with theirs length

--Query 3
select upper(major_name)
as [NAMES]
from major; -- shows the all majors name in the upper case

--Query 4
select substring(courses.course_name, 0, 4)
as [Abbreviation of the name of the Course] 
from courses; -- shows the first three letters of the course name

--5 SubQueries

--Query 5
select student.stu_name as [Eldest]  --shows the name of student who is eldest of all
from student
where student.stu_birthyear =
(select min(student.stu_birthyear ) from student)

--Query 6
select student.stu_name as [youngest] --shows the name of student who is youngest of all
from student
where student.stu_birthyear = 
(select max(student.stu_birthyear )
from student)

-- Query 7
select x.major_name as [Majors whose names contain e] from --shows the name of the majors whose name contains the character 'e'
(select major.major_name from major) as x
where x.major_name like '%e%'

-- Query 8
select x.[Majors whose names contain e] as [Majors whose names contain e and y]  from --shows the name of the majors whose name contains the character 'e' and 'y'
(select x.major_name as [Majors whose names contain e] from
(select major.major_name from major) as x
where x.major_name like '%e%') as x
where x.[Majors whose names contain e] like '%y%'


-- Query 9
select x.[Majors whose names contain e and y] as [Majors whose names contain e, a and s] from
(select x.[Majors whose names contain e] as [Majors whose names contain e and y]  from--shows the name of the majors whose name contains the character 'e','a' and 'y'
(select x.major_name as [Majors whose names contain e] from
(select major.major_name from major) as x
where x.major_name like '%e%') as x
where x.[Majors whose names contain e] like '%a%') as x
where x.[Majors whose names contain e and y] like '%o%'


-- Group by
-- Query 10
select student.stu_name as StudentName --group and order the student by their names
from student
group by student.stu_name
order by  student.stu_name

--Query 11
select major.major_name, count(student.stu_id) as [Number of students per major]  --counts the number of student enrolled in per major
from major
join con_stu_major on conn_major_id = major_id
join student on student.stu_id = con_stu_major.conn_studId
group by major.major_name
order by count(student.stu_id) desc --order it in desc. according the most number of student in per major

--Query 12
select courses.course_size as Size, sum(convert(bigint, courses.course_room)) as [Room Number]
from courses
group by courses.course_size --group the data according to the student capacity in acourse


-- Advance grouping

-- Query 13
select student.stu_name, student.stu_roll from student
group by rollup(student.stu_roll, student.stu_name) --grouping the roll and student name using rollup 

-- Query 14
select courses.course_teacher, courses.course_name, sum(convert(bigint, course_size)) as [SIZE]
from courses
group by rollup(courses.course_teacher, courses.course_name) --grouping the course teacher and course name using rollup 

--Query 15
select student.stu_email, student.stu_gender from student
group by cube(student.stu_email,student.stu_gender) --group email and student gender using cube


-- Query 16
select student.stu_name, student.stu_roll, sum(convert(bigint, student.stu_roll)) as [Roll] from student
group by cube(student.stu_roll, student.stu_name) -- grouping using cube for student name, roll number

-- Query 17
select course_name, course_size,
RANK() OVER (order by courses.course_size) as Ranking --ranking the courses according to the student capacity if each course
from courses

-- Query 18
select course_name, course_size, -- finding the lowest value of  the range
FIRST_VALUE(course_size) OVER (order by courses.course_size) as LowestSize
from courses

-- Multi Table Selects
--Query 19

select courses.course_name, major.major_name -- display course name with respect to its major name
from courses inner join major on courses.major_id = major.major_id  --joins two table 

--Query 20
select student.stu_name, courses.course_name --display the student name with respect to the courses enrolled
from student
join con_stu_major on student.stu_id = con_stu_major.conn_studId
join major on major.major_id = con_stu_major.conn_major_id
join courses on courses.major_id = major.major_id

--Query 21
select courses.course_day,count(major.major_name) as numOfmajors --display the course name and number of student enrolled in per course
from courses,major
where courses.major_id = major.major_id
group by courses.course_day
order by course_day desc


-- Query 22
select courses.course_name, major.major_name -- display the course which have classes in the morning
from courses inner join major on courses.major_id = major.major_id 
where courses.course_schedule like '%am%'

-- Query 23
select major.major_department, count(student.stu_name) as no_of_students_per_department --display the major department and number of student pursuing per major
from major
inner join con_stu_major on major.major_id = con_stu_major.conn_major_id
inner join student on con_stu_major.conn_studId = student.stu_id
group by major.major_department

-- DLM   
--Inserts
INSERT INTO student VALUES (11, 'Amisha',2011,'female','amisha@gmail.com','Japan',1996) -- Inserts
INSERT INTO con_stu_major (conn_studId, conn_major_id) VALUES (11, 8);

select * from student

--Updates
update student   -- updation
set student.stu_birthyear = 1997
where stu_name =  (select stu_name from student where stu_name = 'Amisha')

update con_stu_major
set conn_major_id = 7
where con_stu_major.conn_id = (select top 1 conn_id from con_stu_major order by con_stu_major.conn_major_id desc)

select * from student

--Deletes
delete from con_stu_major where conn_studId = 11 --delete
delete from student where stu_name = (select stu_name from student where stu_name = 'Amisha')

