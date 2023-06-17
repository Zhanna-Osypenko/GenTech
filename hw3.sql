-- 1. Вывести название и стоимость в USD одного самого дорогого проданного товара

SELECT ProductName, Price
FROM Products
order by Price desc
limit 1

-- 2. Вывести два самых дорогих товара из категории Beverages из USA

SELECT 
	Products.ProductName,	
    Products.CategoryID,
    Products.Price,
    Categories.CategoryID,
    Categories.CategoryName,
    Suppliers.Country
FROM Products
	JOIN Categories ON Products.CategoryID=Categories.CategoryID
	JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
WHERE Categories.CategoryName = 'Beverages' AND Suppliers.Country = 'USA'
ORDER BY Products.Price DESC
LIMIT 2

-- 3. Вывести заказы, добавив поле доставлено (или нет), учитывая, что доставлены только 10248 и 10249

SELECT *,
CASE
    WHEN OrderID IN (10248, 10249) THEN "Yes"
    ELSE "No"
END AS is_Delivered
FROM Orders

-- 4. Вывести список стран, которые поставляют морепродукты

SELECT 
	Suppliers.Country,
    Products.CategoryID,
    Categories.CategoryID,
    Categories.CategoryName
FROM Products
	JOIN Categories ON Products.CategoryID=Categories.CategoryID
	JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
WHERE Categories.CategoryName = 'Seafood'
ORDER BY Suppliers.Country


-- 5. Очистить поле ContactName у всех клиентов не из China

update Customers
set ContactName = ''
where Country = 'Brazil'
