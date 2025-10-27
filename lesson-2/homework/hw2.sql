
create database "lesson 2"

use "lesson 2"

----------------------------------------Basic-Level Tasks (10)------------------------------------

-- 1. Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2)).
  
  create table Employees (
    EmpID int,
    Name varchar(50),
    Salary decimal(10,2));

-- 2. Insert three records into the Employees table using different INSERT INTO approaches (single-row insert and multiple-row insert).
  
  insert into Employees (EmpID, Name, Salary)
  values (1, 'Ali', 6500.00);

  insert into Employees (EmpID, Name, Salary)
  values (2, 'Malika', 5200.00),
       (3, 'Javlon', 4800.00);

-- 3. Update the Salary of an employee to 7000 where EmpID = 1.
  
  update Employees 
  set Salary = 7000
  where EmpID = 1

-- 4. Delete a record from the Employees table where EmpID = 2.

  delete from Employees
  where EmpID = 2

-- 5. Give a brief definition for difference between DELETE, TRUNCATE, and DROP.
-- DELETE: tanlangan qatorlarni o'chiradi (WHERE ishlaydi), jadval qoladi.
-- TRUNCATE: barcha qatorlarni o'chiradi, jadval qoladi, tezroq ishlaydi.
-- DROP: jadvalning o'zi va tuzilmasi o'chiriladi.

-- 6. Modify the Name column in the Employees table to VARCHAR(100).
  
  alter table Employees
  alter column Name varchar(100)

-- 7. Add a new column Department (VARCHAR(50)) to the Employees table.
  alter table Employees
  add Department varchar(50)

-- 8. Change the data type of the Salary column to FLOAT.

  alter table Employees
  alter column Salary float

-- 9. Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50)).

  create table Departments (DepartmentID int primary key,
              DepartmentName varchar(50))

-- 10. Remove all records from the Employees table without deleting its structure.

  Truncate table Employees

-------------------------------Intermediate-Level Tasks (6)------------------------------

-- 11. Insert five records into the Departments table using INSERT INTO SELECT method(you can write anything you want as data).

  insert into Departments (DepartmentID, DepartmentName)
  values (1,'HR'),
  (2, 'Finance'),
  (3, 'Budget'),
  (4, 'Strategy'),
  (5, 'IT');

-- 12. Update the Department of all employees where Salary > 5000 to 'Management'.
  
  update  employees
  set salary='Management'
  where salary>5000

--13. Write a query that removes all employees but keeps the table structure intact.
  
  Delete from Employees

--14. Drop the Department column from the Employees table.
  
  alter table Employees
  drop column Department;

--15. Rename the Employees table to StaffMembers using SQL commands.
  
  Exec sp_rename 'Employees', 'StaffMembers';

--16. Write a query to completely remove the Departments table from the database.
  
  drop table if exists Departments

----------------------------------------------Advanced-Level Tasks (9)-----------------------------------------

--17. Create a table named Products with at least 5 columns,
--including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)
  
  DROP TABLE IF EXISTS PRODUCTS
  Create table Products(
    ProductID INT primary key, 
    ProductName varchar(50), 
    Category varchar(50), 
    Price DECIMAL (10,2)
    );

--18 Add a CHECK constraint to ensure Price is always greater than 0.
  
  Alter table Products
  add constraint CK_Products_Price_Positive
  check (Price > 0);

--19. Modify the table to add a StockQuantity column with a DEFAULT value of 50.
  
  Alter table Products
  add StockQuantity int constraint DF_Products_Stock default 50;

--20. Rename Category to ProductCategory
  
  Exec sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';


--21. Insert 5 records into the Products table using standard INSERT INTO queries.

  insert into Products (ProductID, ProductName) values 
  
  (1,'Apple'), 
  (2,'Banana'), 
  (3,'Lemon'), 
  (4,'Peach'), 
  (5,'Mango'); 

--22. Use SELECT INTO to create a backup table called Products_Backup containing all Products data.


Select *into Products_Backup from Products;

--23. Rename the Products table to Inventory.

exec sp_rename 'Products', 'Inventory';

--24. Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.
  
  alter table Inventory
  alter column price float;

--25. Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5 to Inventory table.
  
  ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000, 5);
