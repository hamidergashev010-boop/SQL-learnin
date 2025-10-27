----------------------------------------Easy-Level Tasks (10)------------------------------------

-- 1. Using the Employees and Departments tables, write a query to return the names and salaries of employees whose salary is greater than 50000, along with their department names.
-- 🔁 Expected Columns: EmployeeName, Salary, DepartmentName

select * from Employees
select * from Departments

select 
  concat(e.Name, ' ') AS EmployeeName,
  e.Salary
from Employees e
where e.Salary > (
    select avg(e2.Salary)
    from Employees e2
    where e2.DepartmentID = e.DepartmentID
);


-- 2. Using the Customers and Orders tables, write a query to display customer names and order dates for orders placed in the year 2023.
-- 🔁 Expected Columns: FirstName, LastName, OrderDate

select * from Customers
select * from Orders

select 
  o.OrderID,
  o.OrderDate
from Orders o
left join Payments p ON p.OrderID = o.OrderID
where o.OrderDate < '2020-01-01'
  and p.OrderID is null;


-- 3. Using the Employees and Departments tables, write a query to show all employees along with their department names. Include employees who do not belong to any department.
-- 🔁 Expected Columns: EmployeeName, DepartmentName

select * from Employees
select * from Departments

select 
  concat(e.Name, ' ') as EmployeeName,
  d.DepartmentName
from Employees e
left join Departments d on e.DepartmentID = d.DepartmentID;


-- 4. Using the Products and Suppliers tables, write a query to list all suppliers and the products they supply. Show suppliers even if they don’t supply any product.
-- 🔁 Expected Columns: SupplierName, ProductName

select * from Products
select * from Suppliers

select 
  s.SupplierName,
  p.ProductName
from Suppliers s
left join Products p on s.SupplierID = p.SupplierID;


-- 5. Using the Orders and Payments tables, write a query to return all orders and their corresponding payments. Include orders without payments and payments not linked to any order.
-- 🔁 Expected Columns: OrderID, OrderDate, PaymentDate, Amount

select * from Orders
select * from Payments

select 
  o.OrderID,
  o.OrderDate,
  p.PaymentDate,
  p.Amount
from Orders o
full outer join Payments p on o.OrderID = p.OrderID;


-- 6. Using the Employees table, write a query to show each employee's name along with the name of their manager.
-- 🔁 Expected Columns: EmployeeName, ManagerName

select * from Employees

select 
  concat(e.Name, ' ') as EmployeeName,
  concat(m.Name, ' ') as ManagerName
from Employees e
left join Employees m on e.ManagerID = m.EmployeeID;


-- 7. Using the Students, Courses, and Enrollments tables, write a query to list the names of students who are enrolled in the course named 'Math 101'.
-- 🔁 Expected Columns: StudentName, CourseName

select * from Students
select * from Courses
select * from Enrollments

select 
  s.Name,
  c.CourseName
from Enrollments e
join Students s on e.StudentID = s.StudentID
join Courses  c on e.CourseID  = c.CourseID
where c.CourseName = 'Math 101';


-- 8. Using the Customers and Orders tables, write a query to find customers who have placed an order with more than 3 items. Return their name and the quantity they ordered.
-- 🔁 Expected Columns: FirstName, LastName, Quantity

select * from Customers
select * from Orders

select 
  c.FirstName,
  c.LastName,
  o.Quantity
from Customers c
join Orders o on c.CustomerID = o.CustomerID
where o.Quantity > 3;


-- 9. Using the Employees and Departments tables, write a query to list employees working in the 'Human Resources' department.
-- 🔁 Expected Columns: EmployeeName, DepartmentName

select * from Employees
select * from Departments

select 
  concat(e.Name, ' ') as EmployeeName,
  d.DepartmentName
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Human Resources';


----------------------------------------Medium-Level Tasks (10)------------------------------------

Nodir, [27.10.2025 15:41]
-- 10. Using the Employees and Departments tables, write a query to return department names that have more than 5 employees.
-- 🔁 Expected Columns: DepartmentName, EmployeeCount

select * from Employees
select * from Departments

select 
  d.DepartmentName,
  count(e.EmployeeID) as EmployeeCount
from Departments d
join Employees e on e.DepartmentID = d.DepartmentID
group by d.DepartmentName
having count(e.EmployeeID) > 5;


-- 11. Using the Products and Sales tables, write a query to find products that have never been sold.
-- 🔁 Expected Columns: ProductID, ProductName

select * from Products
select * from Sales

select 
  p.ProductID,
  p.ProductName
from Products p
left join Sales s on s.ProductID = p.ProductID
where s.ProductID is null;


-- 12. Using the Customers and Orders tables, write a query to return customer names who have placed at least one order.
-- 🔁 Expected Columns: FirstName, LastName, TotalOrders

select * from Customers
select * from Orders

select
  c.FirstName,
  c.LastName,
  count(o.OrderID) as TotalOrders
from Customers c
join Orders o on o.CustomerID = c.CustomerID
group by c.FirstName, c.LastName
having count(o.OrderID) >= 1;


-- 13. Using the Employees and Departments tables, write a query to show only those records where both employee and department exist (no NULLs).
-- 🔁 Expected Columns: EmployeeName, DepartmentName

select * from Employees
select * from Departments

select 
  concat(e.Name, ' ') as EmployeeName,
  d.DepartmentName
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID;


-- 14. Using the Employees table, write a query to find pairs of employees who report to the same manager.
-- 🔁 Expected Columns: Employee1, Employee2, ManagerID

select * from Employees

select 
  e1.Name + ' ' + e1.Name as Employee1,
  e2.Name + ' ' + e2.Name as Employee2,
  e1.ManagerID
from Employees e1
join Employees e2 
  on e1.ManagerID = e2.ManagerID
 and e1.EmployeeID < e2.EmployeeID
where e1.ManagerID is not null;


-- 15. Using the Orders and Customers tables, write a query to list all orders placed in 2022 along with the customer name.
-- 🔁 Expected Columns: OrderID, OrderDate, FirstName, LastName

select * from Orders
select * from Customers

select 
  o.OrderID,
  o.OrderDate,
  c.FirstName,
  c.LastName
from Orders o
join Customers c on o.CustomerID = c.CustomerID
where year(o.OrderDate) = 2022;


-- 16. Using the Employees and Departments tables, write a query to return employees from the 'Sales' department whose salary is above 60000.
-- 🔁 Expected Columns: EmployeeName, Salary, DepartmentName

select * from Employees
select * from Departments

select 
  concat(e.Name, ' ') as EmployeeName,
  e.Salary,
  d.DepartmentName
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Sales'
  and e.Salary > 60000;
  

-- 17. Using the Orders and Payments tables, write a query to return only those orders that have a corresponding payment.
-- 🔁 Expected Columns: OrderID, OrderDate, PaymentDate, Amount

select * from Orders
select * from Payments

select 
  o.OrderID,
  o.OrderDate,
  p.PaymentDate,
  p.Amount
from Orders o
join Payments p on o.OrderID = p.OrderID;


-- 18. Using the Products and Orders tables, write a query to find products that were never ordered.
-- 🔁 Expected Columns: ProductID, ProductName

select * from Products
select * from Orders

select
  p.ProductID,
  p.ProductName
from Products p
left join Orders o on o.ProductID = p.ProductID
where o.ProductID is null;


----------------------------------------Hard-Level Tasks (10)------------------------------------

-- 19. Using the Employees table, write a query to find employees whose salary is greater than the average salary in their own departments.
-- 🔁 Expected Columns: EmployeeName, Salary

select * from Employees

select 
  concat(e.Name, ' ') as EmployeeName,
  e.Salary
from Employees e
where e.Salary > (
    select avg(e2.Salary)
    from Employees e2
    where e2.DepartmentID = e.DepartmentID
);

-- 20. Using the Orders and Payments tables, write a query to list all orders placed before 2020 that have no corresponding payment.
-- 🔁 Expected Columns: OrderID, OrderDate

select * from Orders
select * from Payments

select 
  o.OrderID,
  o.OrderDate
from Orders o
left join Payments p on p.OrderID = o.OrderID
where o.OrderDate < '2020-01-01'
  and p.OrderID is null;



-- 21. Using the Products and Categories tables, write a query to return products that do not have a matching category.
-- 🔁 Expected Columns: ProductID, ProductName

select * from Products
select * from Categories

select 
  p.ProductID,
  p.ProductName
from Products p
left join Categories c on c.CategoryID = p.Category
where c.CategoryID is null;



-- 22. Using the Employees table, write a query to find employees who report to the same manager and earn more than 60000.
-- 🔁 Expected Columns: Employee1, Employee2, ManagerID, Salary

select * from Employees

select 
  e1.Name + ' '  as Employee1,
  e2.Name + ' '  as Employee2,
  e1.ManagerID,
  e1.Salary
from Employees e1
join Employees e2 
  on e1.ManagerID = e2.ManagerID
 and e1.EmployeeID < e2.EmployeeID
where e1.ManagerID is not null
  and e1.Salary > 60000
  and e2.Salary > 60000;


-- 23. Using the Employees and Departments tables, write a query to return employees who work in departments which name starts with the letter 'M'.
-- 🔁 Expected Columns: EmployeeName, DepartmentName

select * from Employees
select * from Departments

select 
  concat(e.Name, ' ') as EmployeeName,
  d.DepartmentName
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName like 'M%';


-- 24. Using the Products and Sales tables, write a query to list sales where the amount is greater than 500, including product names.
-- 🔁 Expected Columns: SaleID, ProductName, SaleAmount

select * from Products
select * from Sales

select 
  s.SaleID,
  p.ProductName,
  s.SaleAmount
from Sales s
join Products p on p.ProductID = s.ProductID
where s.SaleAmount > 500;


-- 25. Using the Students, Courses, and Enrollments tables, write a query to find students who have not enrolled in the course 'Math 101'.
-- 🔁 Expected Columns: StudentID, StudentName

select * from Students
select * from Courses
select * from Enrollments

select distinct s.StudentID, s.Name
from Students s
where s.StudentID NOT IN (
    select e.StudentID
    from Enrollments e
    join Courses c on c.CourseID = e.CourseID
    where c.CourseName = 'Math 101'
);


-- 26. Using the Orders and Payments tables, write a query to return orders that are missing payment details.
-- 🔁 Expected Columns: OrderID, OrderDate, PaymentID



-- 27. Using the Products and Categories tables, write a query to list products that belong to either the 'Electronics' or 'Furniture' category.
-- 🔁 Expected Columns: ProductID, ProductName, CategoryName
