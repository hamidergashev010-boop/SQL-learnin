----------------------------------------Easy-Level Tasks (10)------------------------------------

-- 1. Using Products, Suppliers table List all combinations of product names and supplier names.

select p.ProductName, s.SupplierName
from Products p
cross join Suppliers s;

-- 2. Using Departments, Employees table Get all combinations of departments and employees.

select * from Departments
select * from Employees

select d.DepartmentName, e.EmployeeID, e.Name, e.DepartmentID
from Departments d
cross join Employees e;


-- 3. Using Products, Suppliers table List only the combinations where the supplier actually supplies the product. 
-- Return supplier name and product name

select s.SupplierName, p.ProductName
from Products p
join Suppliers s on s.SupplierID = p.SupplierID;


-- 4. Using Orders, Customers table List customer names and their orders ID.

select * from Customers
select c.FirstName, c.LastName, o.OrderID
from Customers c
join Orders o on o.CustomerID = c.CustomerID;


-- 5. Using Courses, Students table Get all combinations of students and courses.

select * from Students
select * from Courses

select s.Name, c.CourseID, c.CourseName
from Students s
cross join Courses c;


-- 6. Using Products, Orders table Get product names and orders where product IDs match.

select p.ProductName, o.OrderID, o.Quantity, o.TotalAmount
from Products p
join Orders o on o.ProductID = p.ProductID;


-- 7. Using Departments, Employees table List employees whose DepartmentID matches the department.

select * from Employees

select d.DepartmentID, d.DepartmentName, e.EmployeeID, e.Name, e.DepartmentID
from Departments d
join Employees e on e.DepartmentID = d.DepartmentID;


-- 8. Using Students, Enrollments table List student names and their enrolled course IDs.

select * from Students

select s.Name, e.CourseID
from Students s
join Enrollments e on e.StudentID = s.StudentID;

-- 9. Using Payments, Orders table List all orders that have matching payments.

select * from Payments
select * from Orders

select distinct o.OrderID, o.CustomerID, p.PaymentID, p.Amount
from Orders o
join Payments p on p.OrderID = o.OrderID;


-- 10. Using Orders, Products table Show orders where product price is more than 100.

select o.OrderID, o.CustomerID, p.PaymentID, p.Amount
from Orders o
join Payments p on p.OrderID = o.OrderID;


----------------------------------------Medium-Level Tasks (10)------------------------------------

-- 11. Using Employees, Departments table List employee names and department names where department IDs are not equal. It means: Show all mismatched employee-department combinations.

select * from Employees

select e.EmployeeID, e.Name, d.DepartmentID, d.DepartmentName
from Employees e
cross join Departments d
where e.DepartmentID <> d.DepartmentID;


-- 12. Using Orders, Products table Show orders where ordered quantity is greater than stock quantity.

select o.OrderID, o.ProductID, o.Quantity, p.StockQuantity
from Orders o
join Products p on p.ProductID = o.ProductID
where o.Quantity > p.StockQuantity;


-- 13. Using Customers, Sales table List customer names and product IDs where sale amount is 500 or more.

select * from Customers

select c.FirstName, c.LastName, s.ProductID, s.SaleAmount
from Sales s
join Customers c on c.CustomerID = s.CustomerID
where s.SaleAmount >= 500;


-- 14. Using Courses, Enrollments, Students table List student names and course names they’re enrolled in.

select * from Students

select st.Name, c.CourseName
from Enrollments e
join Students st on st.StudentID = e.StudentID
join Courses c on c.CourseID = e.StudentID;


-- 15. Using Products, Suppliers table List product and supplier names where supplier name contains “Tech”.

select p.ProductName,  s.SupplierName
from Products p
join Suppliers s on s.SupplierID = p.SupplierID
where s.SupplierName like '%Tech%';


-- 16. Using Orders, Payments table Show orders where payment amount is less than total amount.




-- 17. Using Employees and Departments tables, get the Department Name for each employee.

select * from Employees

Nodir, [27.10.2025 15:40]
select e.EmployeeID, e.Name, e.DepartmentID, d.DepartmentName
from Employees e
join Departments d on d.DepartmentID = e.DepartmentID;


-- 18. Using Products, Categories table Show products where category is either 'Electronics' or 'Furniture'.

select * from Products
select * from Categories

select p.ProductName, cat.CategoryName
from Products p
join Categories cat on cat.CategoryID = p.Category
where cat.CategoryName in ('Electronics', 'Furniture');

-- 19. Using Sales, Customers table Show all sales from customers who are from 'USA'.

select s.*
from Sales s
join Customers c on c.CustomerID = s.CustomerID
where c.Country = 'USA';


-- 20. Using Orders, Customers table List orders made by customers from 'Germany' and order total > 100.

select o.OrderID, o.CustomerID, o.TotalAmount
from Orders o
join Customers c on c.CustomerID = o.CustomerID
where c.Country = 'Germany'
and o.TotalAmount > 100;


----------------------------------------Hard-Level Tasks (10)------------------------------------

-- 21. Using Employees table List all pairs of employees from different departments.

select * from Employees

select
e1.EmployeeID AS Emp1ID, e1.Name AS Emp1First, e1.DepartmentID AS Emp1Dept,
e2.EmployeeID AS Emp2ID, e2.Name AS Emp2First, e2.DepartmentID AS Emp2Dept
from Employees e1
join Employees e2
on e1.EmployeeID < e2.EmployeeID
and e1.EmployeeID <> e2.EmployeeID;


-- 22. Using Payments, Orders, Products table List payment details where the paid amount is not equal to (Quantity × Product Price).



-- 23. Using Students, Enrollments, Courses table Find students who are not enrolled in any course.

-- 24. Using Employees table List employees who are managers of someone, but their salary is less than or equal to the person they manage.

select * from Employees

select distinct
  m.EmployeeID   AS ManagerID,
  m.Name     AS ManagerName,
  m.Salary       AS ManagerSalary,
  s.EmployeeID   AS SubordinateID,
  s.Name     AS SubName,
  s.Salary       AS SubSalary
from Employees s
join Employees m
  on s.ManagerID = m.EmployeeID
where m.Salary <= s.Salary;


-- 25. Using Orders, Payments, Customers table List customers who have made an order, but no payment has been recorded for it.

select * from Customers

select distinct c.CustomerID, c.FirstName, c.LastName
from Orders O
join Customers c on c.CustomerID = o.CustomerID
left join Payments p on p.OrderID = o.OrderID
where p.OrderID is null;
