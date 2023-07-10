-- 1. Вывести ко-во поставщиков не из UK и не из China

SELECT
	COUNT(*) AS total_not_uk_china_suppliers
FROM Suppliers
WHERE
	NOT Country IN ('UK', 'China')

-- 2. Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5

SELECT 
	Round(AVG(Price)) AS avg_price, MAX(Price), MIN(Price)
FROM [Products]
where CategoryID IN (3, 5)

-- 3. Вывести общую сумму проданных товаров

SELECT
	COUNT(*) AS total_products,
    SUM(Products.Price * OrderDetails.Quantity) AS order_cost
FROM Products
LEFT JOIN OrderDetails ON Products.ProductID=OrderDetails.ProductID
WHERE
	OrderDetails.ProductID IS NOT NULL

-- 4. Вывести ко-во стран, которые поставляют напитки

SELECT DISTINCT
	Suppliers.Country
FROM Products
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
JOIN Categories ON Products.CategoryID=Categories.CategoryID
WHERE
	Categories.CategoryName='Beverages'

-- 5. Вывести сумму, на которую было отправлено товаров клиентам в USA

SELECT
    SUM(Products.Price * OrderDetails.Quantity) AS USA_total_price
FROM Products
LEFT JOIN OrderDetails ON Products.ProductID=OrderDetails.ProductID
LEFT JOIN Orders ON OrderDetails.OrderID=Orders.OrderID
LEFT JOIN Customers ON Customers.CustomerID=Orders.CustomerID
WHERE Customers.Country='USA'
