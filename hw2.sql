--1.Вывести телефоны всех поставщиков, кроме тех, что из Germany и France.

SELECT Country, Phone
FROM Suppliers
where 
	not country  in ("Germany","France")

--2. Для товаров до 10 EUR установить категорию 8 и применить наценку в 20%.

UPDATE Products
set CategoryID=8, 
    Price=Price*1.2 
where Price<=10

--3. Удалить поставщиков из USA и Germany.

delete FROM Suppliers
where Country in ("USA","Germany")

--4. Добавить два поставщика из Spain с произвольными номерами телефонов.

INSERT INTO Suppliers(SupplierName, ContactName, Address, City, PostalCode, Country, Phone)
values
	(null,"Osypenko Zhanna",null,"Spain",null,null,"111-1111 11111"),
  (null,"Pupkin Denis",null,"Spain",null,null,"222-2222 2222")

--5. Вывести все товары до 20 EUR из категорий 3 и 6 по убыванию цены.

SELECT * FROM Products
where CategoryID in (3,6)
and Price<=20
order by Price desc

--6. Вывести три самых дорогих товара до 200 EUR.

SELECT * 
FROM Products
order by price desc
limit 3
