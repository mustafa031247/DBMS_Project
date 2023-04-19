create table [User](
id int primary key identity,
UserName varchar(20),
Password varchar(20),
RePassword varchar(20)

);

select * from [User];



Create table Student(
StudentID int primary key identity,
StudentName varchar(20),
FatherName varchar(20),
CNIC nvarchar(30),
PhoneNumber nvarchar(30),
DepartmentID int,
FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)


)
--Insert Student Deatail
insert into Student values('Hassan','Munir',4220155777011,031235624125,1),('Kashif','Muneeb',42225346695,03120233605,2),('Kaashi','Malik',4220155326895,03125558233,3),
('Malik','Khan',420012533266,03325211255,3),('Daniyal','Khan',35220125422532,0310253569,3),('Mouiz','Khan',42202156322656,03120233605,3),
('Bilal','Hassan',4895021225233,03363625352,3),('Mustafa','Hassan',422013226235633,03363925814,1),('Minhal','Khalid',42202156322656,03120233605,3),
('Hassan','Khan',422019632556213,033363252541,3)

insert into Student values('Arreb','Farooq',42201355624558,03352124558,2)
--create procedure for customers detail store in one value 
CREATE PROCEDURE SelectAllStudent
@StdName varchar(30)
AS
begin
SELECT * FROM Student where StudentName=@StdName
end

--execute procedure 
exec SelectAllStudent 'Hassan'

--Select * from Student

select * from Student;

--Truncate Table Student
truncate table Student;

--Drop Table Student
drop table Student


create table std_audit(
au_id int primary key identity,
au_info varchar(max)
);

-- Select AuDit of Student

select * from std_audit

drop table std_audit;

create trigger tr_std_audit on Student
after insert
as
begin
Declare @id int
select @id = StudentID from inserted
insert into std_audit values('Student With id '+Cast(@id as varchar(50))+'  is added at'+Cast(Getdate() as varchar(50)))
end

create trigger tr on Student
after insert as begin
declare @id int
select @id = StudentID from inserted
insert into std_audit values('Student with id'+Cast(@id as varchar(50))+'Is added at'+Cast(GETDATE() as varchar(50)))
end

CREATE PROCEDURE SelectStudent
AS
begin
SELECT * FROM std_audit
end

drop Procedure SelectStudent



-- ####################### CREATE TABLE DEPARTMENT #######################
Create table Department(
DepartmentID int primary key identity,
DepartmentName varchar(20)
)

--insert department value

insert into Department values('COCIS'),('COE'),('COMS')

--Truncate Table Department

truncate table Department;

-- DROP TABLE Department

drop table Department

--Select Value of Department

select * from Department

-- Create Procedure

CREATE PROCEDURE SelectAllDepartment
@DepName varchar(30)
AS
begin
SELECT * FROM Department where DepartmentName=@DepName
end

--execute procedure 
exec SelectAllDepartment 'COCIS'

-- ############# Create Faculty ############

Create Table Faculty(
FacultyID int primary key identity,
FacultyName varchar(20),
PhoneNumber nvarchar(30),
CNIC nvarchar(30),
EmailAddress varchar(30),
DepartmentID int,
FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
)

-- Drop Table Faculty

drop table Faculty;

-- Truncate Table Faculty

truncate table Faculty;

-- Delete Table Faculty

delete from Faculty;

 --Insert Faculty Value

insert  into Faculty values('Khan',03102265222,4221022533225,'hssnkhn57@gmail.com',1),('Muneeb',0336529882,4220125323659,'MuneebKhan52@gmail.com',2),
('Shahid',033625212547,422013685612453,'Khalid123@gmail.com',3),('Areeb',0336259822125,422532659903352,'AreebKhan5698@gmail.com',3),
('Moheen',033625975214,42201369522658,'MoheenShajid@gmail.com',1)

insert into Faculty values('Shahiba',03625145785,422503326555,'Sahiba12@gmail.com',1),('Munir',03256992124,4220159632125,'Munir0987@gmail.com',2)

 --Select Faculty

select * from Faculty

-- ============= Create Table of Book=======================

Create Table Book(
BookID int primary key identity,
BookTitle varchar(20),
BookPrice int,
BookQuantity nvarchar(30),
AuthorID int,
FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
)

-- ============= Insert Value into Book=======================


insert into Book values('Bad Days Of Our Life',700,10,2);
insert into Book values('It Ends with Us',890,2,2);
insert into Book values('Reminders of Him',850,9,3);
insert into Book values('Finding Me A Memoi',1890,8,3);
insert into Book values('Rich Dad Poor Dad',590,9,3);
insert into Book values('Brown Bear',990,5,2);
insert into Book values('A Letter From Teacher',690,10,4);
insert into Book values('If Animals is Human',990,9,5);
insert into Book values('People We Meet',690,8,2);

insert into Book values('Good Days',700,10,2);
truncate table Book

select * from Book

-- ============= Create Table of Author=======================

Create Table Author(
AuthorID int primary key identity,
AuthorName varchar(20),
EmailAddress varchar(30),
AuthorDOB date
)

drop table Author

--Insert Author Details

insert into Author values('John','JohnBr955@gmail.com','5/5/2002'),
('Jeams Clark','JamesClark213@Yahoo.com','10/12/2002'),('Smith Thomson','JamesClark213@Yahoo.com','10/2/1995');

insert into Author values('Jeams Clark','JamesClark213@Yahoo.com','10/12/2002'),('Smith Thomson','SmithTT065@Hotmail.com','10/2/1995'),
('Walker James','WalkerJames1233@gmail.com','2/10/1998'),('Sara Imran','Sara_Imran3662@Yahoo.com','10/2/1995');

--Select Author

select * from Author
truncate table Author
delete from Author
drop table Author




Create Table BookIssue(
BookIssueID int primary key identity,
BookID int,
StudentID int,
FacultyID int,
BookAvailable int,
Fine money,
ReturnDate date,
IssueDate date,

FOREIGN KEY (BookID) REFERENCES Book(BookID),

FOREIGN KEY (StudentID) REFERENCES Student(StudentID),

FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
)

insert into BookIssue values(1,1,1,10,600.0,'5/5/2002','8/10/2022')
select * from BookIssue

truncate table IssueBook;
truncate table Department;
drop table BookIssue;
delete from [User];


select * from Department;

drop table Department






--############################ JOINS#####################

SELECT Book.BookID,Book.BookTitle,Author.AuthorName
FROM Book
INNER JOIN Author ON Book.AuthorID =Author.AuthorID;


Select Student.StudentID,Student.StudentName,Department.DepartmentName
from Student
Inner Join Department On Student.DepartmentID=Department.DepartmentID;