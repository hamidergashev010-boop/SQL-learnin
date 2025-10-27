----------------------------------------Easy-Level Tasks (10)------------------------------------

-- 1. Using Products table, find the total number of products available in each category.

select * from Products

select Category, count(*) as ProductCount
from Products
group by Category;


-- 2. Using Products table, get the average price of products in the 'Electronics' category.

select * from Products

select avg(Price) as AvgElectronicsPrice
from Products
where Category = 'Electronics';


-- 3. Using Customers table, list all customers from cities that start with 'L'.

select * from Customers

select *
from Customers
where City like 'L%';


-- 4. Using Products table, get all product names that end with 'er'.

select * from Products

select ProductName
from Products
where ProductName like '%er';


-- 5. Using Customers table, list all customers from countries ending in 'A'.

select * from Customers

select *
from Customers
where Country like '%A';


-- 6. Using Products table, show the highest price among all products.

select * from Products

select max(Price) as MaxPrice
from Products;


-- 7. Using Products table, label stock as 'Low Stock' if quantity < 30, else 'Sufficient'.

select * from Products

select ProductID, ProductName, StockQuantity, 
case when StockQuantity < 30 then 'Low Stock' else 'Sufficient' end as StockLevel
from Products;


-- 8. Using Customers table, find the total number of customers in each country.

select * from Customers

select Country, count(*) as CustomerCount
from Customers
group by Country;


-- 9. Using Orders table, find the minimum and maximum quantity ordered.

select * from Orders

select min(Quantity) as MinQuantity,
max(Quantity) as MaxQuantity
from Orders;


----------------------------------------Medium-Level Tasks (10)------------------------------------


-- 10. Using Orders and Invoices tables, list customer IDs who placed orders in 2023 January to find those who did not have invoices.

select * from Orders

select * from Invoices

select * from Orders o 
  left join 
  Invoices i on i.CustomerID = o.CustomerID
    where OrderDate >= '2023-01-01' and OrderDate < '2023-02-01'
    and InvoiceID is null;


-- 11. Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted including duplicates.

select ProductName from Products
Union all
select ProductName from Products_Discounted;


-- 12. Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted without duplicates.

select ProductName from Products
Union
select ProductName from Products_Discounted;


-- 13. Using Orders table, find the average order amount by year.

select year(OrderDate) as OrderYear,
avg(TotalAmount) as AvgOrderAmount
from Orders
group by year(OrderDate)
order by OrderYear;


-- 14. Using Products table, group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). Return productname and pricegroup.

select ProductName,
case
when Price < 100 Then 'Low'
when Price Between 100 and 500 Then 'Mid'
else 'High'
end as PriceGroup
from Products;


-- 15. Using City_Population table, use Pivot to show values of Year column in seperate columns ([2012], [2013]) and copy results to a new Population_Each_Year table.

select * from City_Population
select District_name, [2012], [2013]
into Population_Each_Year
from (select District_name, Year, Population
from City_Population
) src
Pivot (
sum(Population) for year in ([2012], [2013])
) p;



-- 16. Using Sales table, find total sales per product Id.

select ProductID, sum(SaleAmount) as TotalSales
from Sales
group by ProductID;


-- 17. Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.

select ProductName 
from Products
where ProductName like '%oo%';


-- 18. Using City_Population table, use Pivot to show values of City column in seperate columns (Bektemir, Chilonzor, Yakkasaroy) and copy results to a new Population_Each_City table.

select * from City_Population
select [Year], [Bektemir], [Chilonzor], [Yakkasaroy]
into Population_Each_City
from (
select District_name, Year, Population
from City_Population
) src
Pivot (
sum(Population) for District_Name in ([Bektemir], [Chilonzor], [Yakkasaroy])
) p;

----------------------------------------Hard-Level Tasks (10)------------------------------------

-- 19. Using Invoices table, show top 3 customers with the highest total invoice amount. Return CustomerID and Totalspent.

select top 3
CustomerID,
sum(TotalAmount) as TotalSpent
from Invoices
group by CustomerID
order by TotalSpent desc;

-- 20. Transform Population_Each_Year table to its original format (City_Population).

select 


-- 21. Using Products and Sales tables, list product names and the number of times each has been sold. (Research for Joins)

select p.ProductName,
count (s.ProductID) as TimesSold
from Products p
left join Sales s on s.ProductID = p.ProductID
group by p.ProductName
order by TimesSold desc, p.ProductName;

-- 22. Transform Population_Each_City table to its original format (City_Population).

select District_name, 
[Year] as Year,
Population
from Population_Each_City
Unpivot (
Population for District_name in ([Bektemir], [Chilonzor], [Yakkasaroy])
) u;
