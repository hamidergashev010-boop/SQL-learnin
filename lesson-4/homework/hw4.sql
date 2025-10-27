
----------------------------------------Easy-Level Tasks (10)------------------------------------


-- 1. Write a query to select the top 5 employees from the Employees table.

select * from Employees
select top 5 * from Employees 
order by Salary desc 


-- 2. Use SELECT DISTINCT to select unique Category values from the Products table.

select distinct Category from Products;


-- 3. Write a query that filters the Products table to show products with Price > 100.

select * from Products 
where price > 100;


-- 4. Write a query to select all Customers whose FirstName start with 'A' using the LIKE operator.

select * from Customers 
where FirstName like 'A%';


-- 5. Order the results of a Products table by Price in ascending order.

select * from Products 
order by Price asc;


-- 6. Write a query that uses the WHERE clause to filter for employees with Salary >= 60000 and DepartmentName = 'HR'.

select * from Employees 
where Salary >= 60000 and DepartmentName = 'HR'; 


-- 7. Use ISNULL to replace NULL values in the Email column with the text "noemail@example.com".From Employees table

select EmployeeID, FirstName, LastName, 
ISNULL (Email, 'noemail@example.com') from Employees;



-- 8. Write a query that shows all products with Price BETWEEN 50 AND 100.

select * from Products 
where Price between 50 and 100;


-- 9. Use SELECT DISTINCT on two columns (Category and ProductName) in the Products table.

select distinct Category, ProductName from Products;



-- 10. After SELECT DISTINCT on two columns (Category and ProductName) Order the results by ProductName in descending order.

select distinct Category, ProductName from Products 
order by ProductName desc;


----------------------------------------Medium-Level Tasks (10)------------------------------------

-- 11. Write a query to select the top 10 products from the Products table, ordered by Price DESC.

select top 10 * from Products order by Price desc;



-- 12. Use COALESCE to return the first non-NULL value from FirstName or LastName in the Employees table.

select *, coalesce (FirstName, LastName) from Employees;


-- 13. Write a query that selects distinct Category and Price from the Products table.

select distinct Category, Price from Products;


-- 14. Write a query that filters the Employees table to show employees whose
-- Age is either between 30 and 40 or DepartmentName = 'Marketing'.

select * from Employees 
where Age between 30 and 40 and DepartmentName = 'Marketing';


-- 15. Use OFFSET-FETCH to select rows 11 to 20 from the Employees table, ordered by Salary DESC.

select * from Employees 
order by Salary desc offset 10 rows fetch next 10 rows only;


-- 16. Write a query to display all products with Price <= 1000 and StockQuantity > 50, sorted by Stock in ascending order.

select * from Products
where Price <= 1000 and StockQuantity > 50 
order by StockQuantity asc;


-- 17. Write a query that filters the Products table for ProductName values containing the letter 'e' using LIKE.

select * from Products
where ProductName like '%e%';

-- 18. Use IN operator to filter for employees who work in either 'HR', 'IT', or 'Finance'.

select * from Employees 
where DepartmentName in ('HR', 'IT', 'Finance');


-- 19. Use ORDER BY to display a list of customers ordered by City in ascending and PostalCode in descending order.
-- Use customers table

select * from Customers .
order by City asc, PostalCode desc;


----------------------------------------Hard-Level Tasks (10)------------------------------------

-- 20. Write a query that selects the top 5 products with the highest sales, using TOP(5) and ordered by SaleAmount DESC.

select top 5 * from Sales
order by SaleAmount desc;


-- 21. Combine FirstName and LastName into one column named FullName in the Employees table. (only in select statement)

select *,  FirstName + ' ' + LastName as FullName from Employees;


-- 22. Write a query to select the distinct Category, ProductName, and Price for products that are priced above $50, 
-- using DISTINCT on three columns.

Nodir, [25.10.2025 17:18]
select distinct Category, ProductName, Price
from Products
where Price > 50;


-- 23. Write a query that selects products whose Price is less than 10% of the average price in the Products table. 
-- (Do some research on how to find average price of all products)

select * from Products
where Price <0.10 * (select avg(price) from Products);


-- 24. Use WHERE clause to filter for employees whose Age is less than 30 and who work in either the 'HR' or 'IT' department.

select * from Employees
where Age < 30
and DepartmentName in ('HR', 'IT');


-- 25. Use LIKE with wildcard to select all customers whose Email contains the domain '@gmail.com'.

select * from Customers
where Email like '%@gmail.com%';


-- 26. Write a query that uses the ALL operator to find employees 
-- --whose salary is greater than all employees in the 'Sales' department.

select * from Employees
where salary > All (select Salary from Employees
where DepartmentName = 'Sales');


-- 27. Write a query that filters the Orders table for orders placed in the last 180 days using BETWEEN and LATEST_DATE in the table.
-- (Search how to get the current date and latest date)

select * from Orders
where OrderDate Between DATEADD (day, -180, (select MAX (OrderDate) from Orders))
and (select MAX (OrderDate) from Orders);
