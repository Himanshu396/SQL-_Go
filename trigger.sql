CREATE TABLE tblemployee(Emp_ID INT(19),Emp_name Varchar(100),Emp_Sal Decimal (10,2));

INSERT INTO tblemployee VALUES (1,'Anand',15000);
INSERT INTO tblemployee VALUES (2,'Neha',12400);
INSERT INTO tblemployee VALUES (3,'Sohan',11500);
INSERT INTO tblemployee  VALUES (4,'Vijay',15500);
INSERT INTO tblemployee VALUES (5,'Sapna',14000);



select * from tblemployee;
truncate table tblemployee;
select * from Employee_Log;
CREATE TABLE Employee_Log
(Emp_ID int,Emp_name varchar(100),Emp_Sal decimal (10,2),Log_Action varchar(100),log_Timestamp datetime);

CREATE TRIGGER trgAfterInsert ON tblemployee 
After  INSERT
AS
 declare @empid int;
 declare @empname varchar(100);
 declare @empsal decimal(10,2);
 declare @log_action varchar(100);

 select @empid=i.Emp_ID, @empname=i.Emp_Name, @empsal=i.Emp_Sal from inserted i; 
 set @log_action='Inserted Record -- After Insert.';

 insert into Employee_log
           (Emp_ID,Emp_Name,Emp_Sal,Log_Action,Log_Timestamp) 
 values(@empid,@empname,@empsal,@log_action,getdate());
 
 PRINT 'AFTER INSERT trigger fired.'
GO

insert into tblemployee values(6,'Ram',10500);

