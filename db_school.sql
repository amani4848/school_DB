create database db_school;
use db_school ;

-- Create the required tables

create table students ( Id int primary key , Student_name varchar(50), Birth_date date , Gender varchar(10), Joining_date date , 
Student_email varchar(50), Academic_level int ,Educational_path varchar (50),Cumulative_average int );

create table Teachers ( Id int primary key ,Teacher_name varchar(50),Birth_date date , Gender varchar(10),Teacher_email varchar(50),
Office_No int );

create table Subjects( Id int primary key , Subject_name varchar(50) );

-- Modify some tables using the alter command

alter table Subjects 
add foreign key( Id ) references Students ( Id );

alter table Subjects 
add foreign key( Id ) references Teachers ( Id );

alter table students 
rename to Students

show tables ;

-- Add some data inside the tables

insert into Students values ( 1 ,'Amani' , "2001-12-04" , 'F', "2020-06-10" , 'amani@example.com' , 4 , 'scientific', 97 ),
( 2 ,'Amal' , "2001-03-16" , 'F', "2021-02-15", 'amal@example.com' , 3 , 'scientific', 67 ),
( 3 ,'Sara' , "2000-11-03" , 'F', "2019-09-10" , 'sara@example.com' , 6 , 'scientific', 98 ),
( 4 ,'Amjad' , "2001-10-09" , 'F', "2020-11-17" , 'amjad@example.com' , 4 , 'scientific', 86 ),
( 5 ,'Afnan' , "2002-04-04" , 'F'," 2020-03-12" , 'afnan@example.com' , 4 , 'humanitarian', 78 ),
( 6 ,'Dalia' , "2003-06-11" , 'F', "2022-03-22" , 'dalia@example.com' , 2 , 'scientific', 70 ),
( 7 ,'Shouq' , "2001-03-25" , 'F', "2020-06-10" , 'shouq@example.com' , 4 , 'humanitarian', 95 ),
( 8 ,'Lara' , "2004-02-17" , 'F', "2021-11-22" , 'lara@example.com' , 3 , 'scientific', 89 ),
( 9 ,'Asma' , "2001-08-22" , 'F'," 2020-11-13" , 'asma@example.com' , 5 , 'scientific', 65 ),
( 10 ,'Maia' , "2002-02-12" , 'F', "2022-09-10" , 'maia@example.com' , 2 , 'humanitarian', 84 )
, ( 11 ,'jana' , "2001-03-11" , 'F', "2020-02-01" , 'jana@example.com' , 5 , 'scientific', 90 ),
( 12 ,'lama' , "2002-03-12" , 'F', "2019-02-03" , 'lama@example.com' , 6 , 'humanitarian', 54 );

select*from Students;

insert into Teachers values ( 1,'Arwa',"1989-02-04",'F','arwa@example.com' ,011),
( 2,'Amjad',"1990-05-01",'F','Amjad@example.com' ,012),
( 3,'Salma',"1991-11-03",'F','salma@example.com' ,013),
( 4,'Aseel',"1987-04-22",'F','aseel@example.com' ,014),
( 5,'Noura',"1988-02-14",'F','noura@example.com' ,015),
( 6,'Rahaf',"1990-05-26",'F','rahaf@example.com' ,016),
( 7,'Remas',"1991-09-12",'F','remas@example.com' ,017),
( 8,'Hanan',"1990-04-16",'F','hanan@example.com' ,018),
( 9,'Maha',"1989-02-12",'F','maha@example.com' ,019),
( 10,'Hajer',"1990-12-08",'F','hajer@example.com' ,201);

select*from Teachers;

insert into Subjects values (1, 'Mathematics'),(2, 'English Language'),(3, 'Science'),(4, 'History'),(5, 'Physics'),
(6, 'Arts');

select * from Subjects ;

Select * from Students order by Student_name asc ;

select Student_name As fname 
from Students ;

update Students
set Student_email ='amalnew@example.com'
where id=2 ;

update Teachers
set Office_No=021 
where id =10 ;

create table outstanding_students 
select * from Students
where Cumulative_average > 85 ;

select*from outstanding_students ;

create table not_excellent_students 
select * from Students
where Cumulative_average < 60 ;

select * from not_excellent_students;

-- SQL query commands
select * from Students
where Student_name like'A%';

select * from Students
where Student_name like'____';

select avg(Cumulative_average) As avg_student_GPA
from Students ;

select max(Cumulative_average) 
from Students ;

select min(Cumulative_average) 
from Students ;

select count(Id)
from Students ;

select Student_name
from Students 
where Cumulative_average =90 AND Academic_level = 5 ;

select distinct Educational_path
from Students ;

select upper('mathematics') ;
select lower('ARTS');

SELECT FLOOR(AVG(Cumulative_average)) AS rounded_avg_gpa
FROM Students;

SET SQL_SAFE_UPDATES = 0;

UPDATE Students
SET Gender = CASE Gender
    WHEN 'F' THEN 'Female'
    ELSE Gender
END;

UPDATE Students
SET Cumulative_average = Cumulative_average + 5
WHERE Cumulative_average < 60;

DELIMITER //
create Procedure student_info ()
begin
select Students.Student_name AS Student_name , Subjects.Subject_name AS Subject_name
from Students inner join Subjects
on Students.Id=Subjects.Id ;
end 

call student_info ();

create view teacher_info AS
 select Teachers.Teacher_name ,Teachers.Office_No ,Subjects.Subject_name
 from Teachers inner join Subjects
 on Teachers.Id = Subjects.Id ;

select* from teacher_info;

/*If you want to delete the view, use this command
 drop view teacher_info ; */ 
 
 create index student_name 
 on Students (Student_name ASC) ;
 
show indexes from Students;

/*If you want to delete the view, use this command
 drop index student_name on Students ; */ 
