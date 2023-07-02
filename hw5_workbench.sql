-- 1. Вывести информацию о трех самых дорогих товарах не из China (проекция: названиетовара, ценатоваравusd, названиепоставщика, странапоставщика)

SELECT Products.ProductName, Price*1.1 as Price_usd, Suppliers.SupplierName, Suppliers.Country
FROM Products
join Suppliers on Products.SupplierID=Suppliers.SupplierID
where not Suppliers.Country="China"
order by price desc
limit 3

-- 2. Вывести страны клиентов и поставщиков (за исключением USA)

SELECT Country FROM Suppliers
WHERE Country!='USA'

UNION

SELECT Country FROM Customers
WHERE Country!='USA'

-- 3. Вывести названия проданных товаров

SELECT Products.ProductName, OrderDetails.Quantity
FROM Products
left join OrderDetails on Products.ProductID=OrderDetails.ProductID
where OrderDetails.Quantity is not null

-- В рамках БД "стриминг-платформа":
-- 4. С помощью DDL создайте таблицу "комментарии юзеров к видео"

create table comments (
	comment_id int,
    text_comment varchar(200),
    stream_id int,
    username varchar(32),
    created_at timestamp
);


INSERT INTO comments (comment_id, text_comment, stream_id, username, created_at)
VALUES
	(1, 'I like it', 1, "John", CURRENT_TIMESTAMP),
	(2, 'I dont like it',2, "Kate", CURRENT_TIMESTAMP),
	(3, 'that is great!!!',3, "Michael", CURRENT_TIMESTAMP),
    (4, 'Good job',4,"Sophia", CURRENT_TIMESTAMP),
    (5, 'No thanks',5, "Sophia", CURRENT_TIMESTAMP)



-- 5. Вывести три последних комментария, включая имена авторов и названия видео

select comments.text_comment, comments.username, streams.title 
from comments
left join streams on comments.stream_id=streams.stream_id
order by comments.created_at desc
limit 3