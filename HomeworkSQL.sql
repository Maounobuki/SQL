-- Homework 1
-- Создайте таблицу с мобильными телефонами, используя графический интерфейс(или скрипт**). Заполните БД данными
CREATE DATABASE Homework;
USE Homework;
CREATE TABLE Homework1SmatphoneShop
(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
manufacturer VARCHAR(30)  NOT NULL,
model_name VARCHAR(30)  NOT NULL,
quantity INT,
price DECIMAL(8,2)
);

INSERT INTO Homework1SmatphoneShop (manufacturer, model_name, quantity, price)
VALUES
('Xiaomi','Redmi7',3,12000.00),
('Xiaomi','Redmi10',2,17000.00),
('Samsung','GalaxyA53',1,42000.00),
('Samsung','GalaxyA58',4,22000.00),
('Apple','iPhone X',1,78000.00),
('Apple','iPhone X',1,102700.00);

SELECT * FROM Homework1SmatphoneShop;
UPDATE Homework1SmatphoneShop
SET model_name = 'iPhone 14 pro'
WHERE price = '102700.00';

-- Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT * FROM Homework1SmatphoneShop;
SELECT model_name, manufacturer, price FROM Homework1SmatphoneShop WHERE quantity > 2;
--  Выведите весь ассортимент товаров марки “Samsung”
SELECT model_name FROM Homework1SmatphoneShop WHERE manufacturer LIKE 'Samsung';
-- *4.*** С помощью регулярных выражений найти:

-- 4.1. Товары, в которых есть упоминание "Iphone"
SELECT * FROM Homework1SmatphoneShop 
WHERE id LIKE '%Samsung%' OR manufacturer LIKE '%Samsung%' OR model_name LIKE '%Samsung%' OR quantity LIKE '%Samsung%' OR price LIKE '%Samsung%';

-- 4.2. "Samsung"
SELECT * FROM Homework1SmatphoneShop
 WHERE id LIKE '%iPhone%' OR manufacturer LIKE '%iPhone%' OR model_name LIKE '%iPhone%' OR quantity LIKE '%iPhone%' OR price LIKE'iPhone%';

-- 4.3. Товары, в которых есть ЦИФРА "8"
SELECT * FROM Homework1SmatphoneShop 
WHERE id LIKE '%8%' OR manufacturer LIKE '%8%' OR model_name LIKE '%8%' OR quantity LIKE '%8%' OR price LIKE '%8%';

-- Homework 2
-- Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
USE Homework;
DROP TABLE IF EXISTS salesHomework2;
CREATE TABLE salesHomework2
(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
order_date DATE NOT NULL,
count_product INT NOT NULL
);
INSERT INTO salesHomework2 (order_date, count_product)
VALUES 
("2023-02-02", 25),
("2023-03-12", 120),
("2023-04-06", 90),
("2023-05-18", 320),
("2023-06-24", 201);

-- Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300, используя функцию IF
SELECT * FROM salesHomework2;
SELECT 
id AS 'Номер заказа',
order_date AS 'Дата заказа',
count_product AS 'Количество',
 IF (count_product < 100, 'Маленький заказ', 
   IF (count_product BETWEEN 100 AND 300, 'Средний заказ', 
     IF (count_product > 300, 'Большой заказ', 'Не определено')  
      )
 )
 AS 'Размер заказа'
FROM salesHomework2;

-- Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
USE Homework;
DROP TABLE IF EXISTS ordersHomework2;
CREATE TABLE ordersHomework2
(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
employee_id VARCHAR(10) NOT NULL,
amount DECIMAL(5,2) NOT NULL,
order_status VARCHAR(10) NOT NULL
);
INSERT INTO ordersHomework2 (employee_id, amount, order_status)
VALUES 
('e03',15.00, 'OPEN'),
('e01',25.50, 'OPEN'),
('e05',100.70, 'CLOSED'),
('e02',22.18, 'OPEN'),
('e04',9.50, 'CANCELLED');
SELECT 
	id,
    employee_id,
	amount,
	order_status,
	CASE 
		WHEN order_status = 'OPEN' THEN 'Order is in open state'
		WHEN order_status = 'CLOSED' THEN 'Order is closed'
		ELSE 'Order is cancelled'
	END AS 'full_order_status'	
FROM ordersHomework2; 

-- Homework 3
USE Homework;
DROP TABLE IF EXISTS `staffHomework3`;
CREATE TABLE IF NOT EXISTS `staffHomework3`
(`id` INT PRIMARY KEY AUTO_INCREMENT,
`firstname` VARCHAR(45),
`lastname` VARCHAR(45),
`post` VARCHAR(45),
`seniority` INT,
`salary` INT,
`age` INT);

INSERT INTO `staffHomework3` (`firstname`, `lastname`, `post`,`seniority`,`salary`, `age`)
VALUES
('Вася', 'Васькин', 'Начальник', 40, 100000, 60), 
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);


-- Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания
SELECT* 
FROM staffHomework3
ORDER BY salary;

SELECT* 
FROM staffHomework3
ORDER BY salary DESC;

-- Выведите 5 максимальных заработных плат (salary)
SELECT* 
FROM staffHomework3
ORDER BY salary DESC
LIMIT 5;
-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT SUM(salary), post 
FROM staffHomework3
GROUP BY post;
-- Найдите кол-во сотрудников со специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT
GROUP_CONCAT(lastname) AS 'names_staff',
COUNT(post)
FROM
staffHomework3
WHERE post = 'Рабочий' AND (age BETWEEN 24 AND 49);

-- Найдите количество специальностей
SELECT
GROUP_CONCAT(DISTINCT post) AS 'post_names',
COUNT(DISTINCT post)
FROM
staffHomework3;

-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет включительно
SELECT DISTINCT post 
FROM
staffHomework3
WHERE (SELECT AVG(age)) < 30;
DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
	`id` INT,
    `shopname` VARCHAR (100),
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS `cats`;
CREATE TABLE `cats` (
	`name` VARCHAR (100),
    `id` INT,
    PRIMARY KEY (id),
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)
        REFERENCES `shops` (id)
);

INSERT INTO `shops`
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

INSERT INTO `cats`
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);


-- Последнее задание, таблица:

DROP TABLE IF EXISTS Analysis;

CREATE TABLE Analysis
(
	an_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	an_name varchar(50),
	an_cost INT,
	an_price INT,
	an_group INT
);

INSERT INTO analysis (an_name, an_cost, an_price, an_group)
VALUES 
	('Общий анализ крови', 30, 50, 1),
	('Биохимия крови', 150, 210, 1),
	('Анализ крови на глюкозу', 110, 130, 1),
	('Общий анализ мочи', 25, 40, 2),
	('Общий анализ кала', 35, 50, 2),
	('Общий анализ мочи', 25, 40, 2),
	('Тест на COVID-19', 160, 210, 3);

-- Homework 4
USE homework;
DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
	`id` INT,
    `shopname` VARCHAR (100),
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS `cats`;
CREATE TABLE `cats` (
	`name` VARCHAR (100),
    `id` INT,
    PRIMARY KEY (id),
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)
        REFERENCES `shops` (id)
);

INSERT INTO `shops`
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

INSERT INTO `cats`
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);


-- Последнее задание, таблица:
USE homework;
DROP TABLE IF EXISTS Analysis;

CREATE TABLE Analysis
(
	an_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	an_name varchar(50),
	an_cost INT,
	an_price INT,
	an_group INT
);

INSERT INTO analysis (an_name, an_cost, an_price, an_group)
VALUES 
	('Общий анализ крови', 30, 50, 1),
	('Биохимия крови', 150, 210, 1),
	('Анализ крови на глюкозу', 110, 130, 1),
	('Общий анализ мочи', 25, 40, 2),
	('Общий анализ кала', 35, 50, 2),
	('Общий анализ мочи', 25, 40, 2),
	('Тест на COVID-19', 160, 210, 3);

DROP TABLE IF EXISTS GroupsAn;

CREATE TABLE GroupsAn
(
	gr_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	gr_name varchar(50),
	gr_temp FLOAT(5,1),
	FOREIGN KEY (gr_id) REFERENCES Analysis (an_id)
	ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO groupsan (gr_name, gr_temp)
VALUES 
	('Анализы крови', -12.2),
	('Общие анализы', -20.0),
	('ПЦР-диагностика', -20.5);

SELECT * FROM groupsan;

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
(
	ord_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	ord_datetime DATETIME,	-- 'YYYY-MM-DD hh:mm:ss'
	ord_an INT,
	FOREIGN KEY (ord_an) REFERENCES Analysis (an_id)
	ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Orders (ord_datetime, ord_an)
VALUES 
	('2020-02-04 07:15:25', 1),
	('2020-02-04 07:20:50', 2),
	('2020-02-04 07:30:04', 1),
	('2020-02-04 07:40:57', 1),
	('2020-02-05 07:05:14', 1),
	('2020-02-05 07:15:15', 3),
	('2020-02-05 07:30:49', 3),
	('2020-02-06 07:10:10', 2),
	('2020-02-06 07:20:38', 2),
	('2020-02-07 07:05:09', 1),
	('2020-02-07 07:10:54', 1),
	('2020-02-07 07:15:25', 1),
	('2020-02-08 07:05:44', 1),
	('2020-02-08 07:10:39', 2),
	('2020-02-08 07:20:36', 1),
	('2020-02-08 07:25:26', 3),
	('2020-02-09 07:05:06', 1),
	('2020-02-09 07:10:34', 1),
	('2020-02-09 07:20:19', 2),
	('2020-02-10 07:05:55', 3),
	('2020-02-10 07:15:08', 3),
	('2020-02-10 07:25:07', 1),
	('2020-02-11 07:05:33', 1),
	('2020-02-11 07:10:32', 2),
	('2020-02-11 07:20:17', 3),
	('2020-02-12 07:05:36', 1),
	('2020-02-12 07:10:54', 2),
	('2020-02-12 07:20:19', 3),
	('2020-02-12 07:35:38', 1);

-- Используя JOIN-ы, выполните следующие операции:

-- 1.Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)
SELECT shops.id AS 'shop id', cats.name  AS 'Cats'
FROM shops
JOIN cats
ON shops.id = cats.shops_id;

-- 2.Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)

SELECT shops.shopname
FROM shops
JOIN cats
WHERE shops.id = cats.shops_id AND cats.name = "Murzik";
 
SELECT shops.shopname
FROM shops
JOIN cats
ON shops.id = cats.shops_id AND cats.name = "Murzik";

-- 3.Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”

SELECT shops.shopname
FROM shops
WHERE shops.id NOT IN (
SELECT shops.id FROM shops
JOIN cats
ON shops.id = cats.shops_id
WHERE cats.name IN ('Murzik', 'Zuza'));

-- 4.Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.
SELECT an_name, an_price
FROM Analysis
JOIN Orders ON Analysis.an_id = Orders.ord_an
WHERE ord_datetime BETWEEN '2020-02-05' AND '2020-02-12';

-- Homework 5

USE homework;
DROP TABLE IF EXISTS cars;
CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
 `name` VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE OR REPLACE VIEW lowcost_auto
AS
SELECT *
FROM cars
WHERE cost<25000;
SELECT * FROM lowcost_auto;
-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW lowcost_auto
AS
SELECT *
FROM cars
WHERE cost<30000;
SELECT * FROM lowcost_auto;
-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)
CREATE OR REPLACE VIEW direct_model
AS
SELECT *
FROM cars
WHERE `name` = "Audi" OR `name` = "Skoda";
SELECT * FROM direct_model;
-- Доп задания:
-- 1* Получить ранжированный список автомобилей по цене в порядке возрастания
SELECT
ROW_NUMBER() OVER(ORDER BY cost) `№`,
cost as `cost`, `name` as `name`
FROM cars;
-- 2* Получить топ-3 самых дорогих автомобилей, а также их общую стоимость  


SELECT`name`, cost, SUM(cost) OVER()
FROM cars
ORDER BY cost DESC
LIMIT 3;

-- 3* Получить список автомобилей, у которых цена больше предыдущей цены
SELECT *,                                          
LAG(name,1) OVER (ORDER BY cost) AS higher_cost    -- По 
FROM cars;

-- 4* Получить список автомобилей, у которых цена меньше следующей цены
SELECT name, cost,
LEAD (name, 1) OVER (ORDER BY cost DESC) AS lower_cost
FROM cars;

-- 5*Получить список автомобилей, отсортированный по возрастанию цены, и добавить столбец со значением разницы между текущей ценой и ценой следующего автомобиля
SELECT *,
cost - LAG(cost)  OVER w AS 'diff' 
FROM cars
WINDOW w AS (ORDER BY cost);