Nodir, [27.10.2025 15:33]
----------------------------------------Easy-Level Tasks (10)------------------------------------

-- 1. Write a query to find the minimum (MIN) price of a product in the Products table.

select min(Price) as MinPrice
from Products;


-- 2. Write a query to find the maximum (MAX) Salary from the Employees table.

select max(Salary) as MaxSalary
from Employees;


-- 3. Write a query to count the number of rows in the Customers table.

select count(*) as CustomerCount
from Customers;


-- 4. Write a query to count the number of unique product categories from the Products table.

select count(distinct Category) as UniqueCategoryCount
from Products;


-- 5. Write a query to find the total sales amount for the product with id 7 in the Sales table.

select sum(SaleAmount) as TotalSales7
from Sales
where ProductID = 7;


-- 6. Write a query to calculate the average age of employees in the Employees table.

select avg (Age) as AvgAge
from Employees;


-- 7. Write a query to count the number of employees in each department.

select DepartmentName, count (*) as EmployeeCount
from Employees
group by DepartmentName;


-- 8. Write a query to show the minimum and maximum Price of products grouped by Category. Use products table.

select Category,
min(Price) as MinPrice,
max(Price) as MaxPrice
from Products
group by Category;

-- 9. Write a query to calculate the total sales per Customer in the Sales table.

select CustomerID,
sum(SaleAmount) as TotalSales
from Sales
group by CustomerID;

-- 10. Write a query to filter departments having more than 5 employees from the Employees table.(DeptID is enough, if you don't have DeptName).

select * from Employees

select DepartmentName, count (*) as EmployeeCount
from Employees
group by DepartmentName
having count (*) > 5;



----------------------------------------Medium-Level Tasks (10)------------------------------------

-- 11. Write a query to calculate the total sales and average sales for each product category from the Sales table.

select * from Sales

select ProductID,
sum (SaleAmount) as TotalSales,
avg (SaleAmount) as AvgSales
from Sales
group by ProductID;


-- 12. Write a query to count the number of employees from the Department HR.

select * from Employees

select count (*) as 'HR Employees'
from Employees
where DepartmentName = 'HR';


-- 13. Write a query that finds the highest and lowest Salary by department in the Employees table.(DeptID is enough, if you don't have DeptName).

select
DepartmentName,
max (Salary) as MaxSalary,
min (Salary) as MinSalary
from Employees
group by DepartmentName;

-- 14. Write a query to calculate the average salary per Department.(DeptID is enough, if you don't have DeptName).

select DepartmentName,
avg (Salary) as AvgSalary
from Employees
group by DepartmentName;

-- 15. Write a query to show the AVG salary and COUNT(*) of employees working in each department.(DeptID is enough, if you don't have DeptName).

select DepartmentName,
avg (Salary) as AvgSalary,
count (*) as EmployeeCount
from Employees
group by DepartmentName;

-- 16. Write a query to filter product categories with an average price greater than 400.

select Category,
avg (Price) as AvgPrice
from Products
group by Category
having avg(Price) > 400;

-- 17. Write a query that calculates the total sales for each year in the Sales table.

select year (SaleDate) as SalesYear,
sum (SaleAmount) as TotalSales
from Sales
group by Year (SaleDate)
order by SalesYear;

-- 18. Write a query to show the list of customers who placed at least 3 orders.

select CustomerID,
count (*) as OrderCount
from Orders
group by CustomerID
having count (*) >= 3;


-- 19. Write a query to filter out Departments with average salary expenses greater than 60000.(DeptID is enough, if you don't have DeptName).

select DepartmentName,
avg (Salary) as AvgSalary
from Employees
group by DepartmentName
having avg (Salary) > 60000;


----------------------------------------Hard-Level Tasks (10)------------------------------------

Nodir, [27.10.2025 15:33]
-- 20. Write a query that shows the average price for each product category, and then filter categories with an average price greater than 150.

select Category,
avg (Price) as AvgPrice
from Products
group by Category
having avg (Price) > 150;


-- 21. Write a query to calculate the total sales for each Customer, then filter the results to include only Customers with total sales over 1500.

select CustomerID,
sum (SaleAmount) as TotalSales
from Sales
group by CustomerID
having sum (SaleAmount) > 1500;


-- 22. Write a query to find the total and average salary of employees in each department, and filter the output to include only departments with an average salary greater than 65000.

select DepartmentName,
sum (Salary) as TotalSalary,
avg (Salary) as AvgSalary
from Employees
group by DepartmentName
having avg (Salary) > 65000;


-- 23. Write a query to find total amount for the orders which weights more than $50 for each customer along with their least purchases.(least amount might be lower than 50, use tsql2012.sales.orders table,freight col, ask ur assistant to give the TSQL2012 database).

select * from Orders

select CustomerID,
sum (case when TotalAmount > 50 then TotalAmount else 0 end) as TotalAmountOver50,
min (TotalAmount) as LeastPurchase
from Orders
group by CustomerID
order by CustomerID;


-- 24. Write a query that calculates the total sales and counts unique products sold in each month of each year, and then filter the months with at least 2 products sold.(Orders)

select * from Orders

select year (OrderDate) as SalesYear,
month (OrderDate) as SalesMonth,
sum (TotalAmount) as TotalSales,
count (distinct ProductID) as UniqueProducts
from Orders
group by year (OrderDate), month (OrderDate)
having count (distinct ProductID) >= 2
order by SalesYear, SalesMonth;


-- 25. Write a query to find the MIN and MAX order quantity per Year. From orders table.

select * from Orders

select year (OrderDate) as OrderYear,
min (Quantity) as MinOrderQty,
max (Quantity) as MaxOrderQty
from Orders
group by year (OrderDate)
order by OrderYear;
