-- 1. Найти мин/стоимость товаров для каждой категории

    SELECT 
        CategoryID, min(Price)
    FROM Products
    group by CategoryID


-- 2. Вывести ТОП-3 стран по количеству доставленных заказов

    SELECT
        Customers.Country,
        count(*) as total_orders
    FROM [Orders]
    join Customers on Orders.CustomerID = Customers.CustomerID
    group by Customers.Country
    order by total_orders desc
    limit 3


-- 3. Вывести названия категорий, в которых более 10 товаров

    SELECT
        Categories.CategoryName, 
        count(*) as total_products
    FROM [Products]
    join Categories on Products.CategoryID = Categories.CategoryID
    group by Categories.CategoryName
    Having total_products > 10

-- 4. Очистить тел/номер поставщикам из USA

    UPDATE Suppliers
    SET Phone = NULL
    WHERE Country = 'USA'

-- 5. Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15

    SELECT
        Employees.LastName, Employees.FirstName,
        count(*) as total_orders
    FROM [Orders]
    join Employees on Orders.EmployeeID = Employees.EmployeeID
    group by Employees.LastName
    having total_orders < 15
    order by total_orders
