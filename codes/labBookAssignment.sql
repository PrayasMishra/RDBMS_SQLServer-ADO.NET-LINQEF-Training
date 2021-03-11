create database Training_EXAMPLE


---1.3(1)
create table Customer1(
						Customer1id int unique not null,
						Customer1Name varchar(20) not null,
						Address1 varchar(30),
						Address2 varchar(30),
						ContactNumber varchar(12) not null,
						PostalCode varchar(10)
					  )
---1.3(2)
create table Employees(EmployeeId int not null primary key,Name nvarchar(255) null)

---1.3(3)
create table Contractors(ContractId int not null primary key,Name nvarchar(255) null)

---1.3(4)
create table TestRethrow(Id int primary key)

---1
create type Region from varchar(15) NOT NULL

---2
create default Region_default as 'North America'

---3
 exec sp_bindefault Region_default,'Customer1_Region'

---4
alter table Customer1 add Customer1_Region Region

---5
alter table Customer1 add Gender char(1)

---6
alter table Customer1 add constraint chk_gender check(Gender in('M','F','T'))

---7---8---9
create table Orders(
					OrdersId int not null identity(1000,1) constraint fk_CustOrders foreign key references Customer1(Customer1id),
					Customer1Id int not null,
					OrdersDate Datetime,
					Order_State char(1) constraint chk_state check(Order_State in('P','C'))
				   )

sp_help Orders

select * from Orders

---TASK 1
create sequence IdSequence as int start with 10000 increment by 1

---TASK-2
insert Employees(EmployeeId,Name) values(next value for IdSequence,'Shashank')

insert Contractors(ContractId,Name) values(next value for IdSequence,'Aditya')

select *from Employees

select * from Contractors

--1.4 
--1--
select Stud_Code,Stud_Name,Dept_Code from Student_master
--2---
select Staff_Code,Staff_Name,Dept_Code from Staff_Master
--3--
select Staff_Name,Salary,Dept_Code from Staff_Master where Dept_Code=20 or Dept_Code=30 or Dept_Code=40
--4--
select Stud_Code,Sum(Subject1+Subject2+Subject3) as Total_Score from Student_Marks group by Stud_Code order by Total_Score Desc
--5--
select * from Book_Master where Book_name like'An%'
--6--
select s.Dept_Code from Student_master s,Student_Marks s1 where s.Stud_Code=s1.Stud_Code and s1.Stud_Year=2007

--8
select Staff_Code,Staff_Name,Dept_Code,Hiredate from Staff_Master
--9
select *from Staff_Master where Hiredate<'21-Jan-99'
--10
select Stud_Name,Dept_Code,Stud_Dob from Student_master where Stud_Dob>='01-Jan-1981' and Stud_Dob<'31-Mar-1983'
--11
select  Stud_Code from Student_Marks where Subject2 is null


--Merge question

CREATE TABLE Products
(
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Rate MONEY
) 

INSERT INTO Products
VALUES
(1,'Tea', 10.00),
(2, 'Coffee', 20.00),
(3, 'Muffin', 30.00),
(4, 'Biscuit', 40.00)

CREATE TABLE UpdatedProducts
(
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Rate MONEY
) 

INSERT INTO UpdatedProducts
VALUES
(1, 'Tea', 10.00),
(2, 'Coffee', 25.00),
(3, 'Muffin', 35.00),
(5, 'Pizza', 60.00)

MERGE Products AS TARGET
USING UpdatedProducts AS SOURCE 
ON (TARGET.ProductID = SOURCE.ProductID) 

WHEN MATCHED THEN
UPDATE SET TARGET.ProductName=SOURCE.ProductName,
TARGET.Rate = SOURCE.Rate

WHEN NOT MATCHED BY TARGET THEN 
INSERT (ProductID, ProductName, Rate) 
VALUES (SOURCE.ProductID, SOURCE.ProductName, SOURCE.Rate);

select * from Products

select * from UpdatedProducts