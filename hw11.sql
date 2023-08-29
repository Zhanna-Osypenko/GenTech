-- 1. Описать таблицу videos с исп. механизма Constraints (поля: id, название, продолжительность, статусопубликования, датавремя_добавления)

CREATE TABLE videos (
    id INT PRIMARY KEY auto_increment,
    title VARCHAR(255) NOT NULL,
    duration INT CHECK (duration >= 0),
    publication_status ENUM('published', 'unpublished') DEFAULT 'unpublished',
    datetime_added DATETIME
);


-- 2. Вывести товары, которые не были ни разу заказаны (с помощью подзапросов)
                -- option 1
SELECT *
FROM Products
WHERE ProductId NOT IN (SELECT ProductId FROM OrderDetails)


                -- option 2
SELECT *
FROM Products LEFT JOIN OrderDetails using (ProductId)
WHERE OrderID is Null


-- 3. Вывести заказы, сделанные с 1 мая 2022 по 20 мая 2022 (в рамках новой БД, сделанной в "супер-песочнице")

SELECT *
FROM orders
WHERE OrderDate BETWEEN '1996-01-01' AND '1996-12-31' 
-- в orders в "супер-песочнице" нет 2022года


-- 4. Описать схему БД "онлайн-тестирование" с помощью инструмента онлайн-проектирования БД. Необходимо предусмотреть регистрацию пользователя и выбор им тем для прохождения тестирования.

https://dbdiagram.io/d/64edec9002bd1c4a5e9c2afd

