-- 11. Return: EmployeeName, DepartmentName, Salary
-- Task: Show the employees who work in the HR department and earn a salary greater than 60000.
-- Tables Used: Employees, Departments

select * from Employees
select * from Departments

select 
  concat(e.Name, ' ') as EmployeeName,
  d.DepartmentName,
  e.Salary
from Employees e
join Departments d on d.DepartmentID = e.DepartmentID
where d.DepartmentName = 'HR'
  and e.Salary > 60000;


-- 12. Return: ProductName, SaleDate, StockQuantity
-- Task: List the products that were sold in 2023 and had more than 100 units in stock at the time.
-- Tables Used: Products, Sales

select * from Products
select * from Sales

select 
  p.ProductName,
  s.SaleDate,
  p.StockQuantity
from Sales s
join Products p on p.ProductID = s.ProductID
where year(s.SaleDate) = 2023
  and p.StockQuantity > 100;


-- 13. Return: EmployeeName, DepartmentName, HireDate
-- Task: Show employees who either work in the Sales department or were hired after 2020.
-- Tables Used: Employees, Departments

select * from Employees
select * from Departments

select 
  concat(e.Name, ' ') as EmployeeName,
  d.DepartmentName,
  e.HireDate
from Employees e
join Departments d on d.DepartmentID = e.DepartmentID
where d.DepartmentName = 'Sales'
   or e.HireDate > '2020-12-31';


----------------------------------------Hard-Level Tasks (10)------------------------------------

-- 14. Return: CustomerName, OrderID, Address, OrderDate
-- Task: List all orders made by customers in the USA whose address starts with 4 digits.
-- Tables Used: Customers, Orders

select * from Customers
select * from Orders

select 
  c.FirstName,
  o.OrderID,
  c.Address,
  o.OrderDate
from Customers c
join Orders o on o.CustomerID = c.CustomerID
where c.Country = 'USA'
  and c.Address like '[0-9][0-9][0-9][0-9]%';


-- 15. Return: ProductName, Category, SaleAmount
-- Task: Display product sales for items in the Electronics category or where the sale amount exceeded 350.
-- Tables Used: Products, Sales

select * from Products
select * from Sales

select 
  p.ProductName,
  p.Category,
  s.SaleAmount
from Sales s
join Products p on p.ProductID = s.ProductID
where p.Category = 'Electronics'
   or s.SaleAmount > 350;


-- 16. Return: CategoryName, ProductCount
-- Task: Show the number of products available in each category.
-- Tables Used: Products, Categories

select * from Products
select * from Categories

select 
  c.CategoryName,
  count(p.ProductID) as ProductCount
from Categories c
left join Products p on p.Category = c.CategoryID
group by c.CategoryName;

-- 17. Return: CustomerName, City, OrderID, Amount
-- Task: List orders where the customer is from Los Angeles and the order amount is greater than 300.
-- Tables Used: Customers, Orders

select * from Customers
select * from Orders

select 
  c.FirstName,
  c.City,
  o.OrderID,
  o.TotalAmount as Amount
from Customers c
join Orders o on o.CustomerID = c.CustomerID
where c.City = 'Los Angeles'
  and o.TotalAmount > 300;


-- 18. Return: EmployeeName, DepartmentName
-- Task: Display employees who are in the HR or Finance department, or whose name contains at least 4 vowels.
-- Tables Used: Employees, Departments

select * from Employees
select * from Departments



-- 19. Return: EmployeeName, DepartmentName, Salary
-- Task: Show employees who are in the Sales or Marketing department and have a salary above 60000.
-- Tables Used: Employees, Departments

select * from Employees
select * from Departments

select 
  concat(e.Name, ' ') as EmployeeName,
  d.DepartmentName,
  e.Salary
from Employees e
join Departments d on d.DepartmentID = e.DepartmentID
where d.DepartmentName in ('Sales', 'Marketing')
  and e.Salary > 60000;
