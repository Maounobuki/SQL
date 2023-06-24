-- Homework 1
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
SELECT * FROM Homework1SmatphoneShop;
SELECT model_name, manufacturer, price FROM Homework1SmatphoneShop WHERE quantity > 2;
SELECT model_name FROM Homework1SmatphoneShop WHERE manufacturer LIKE 'Samsung';
SELECT * FROM Homework1SmatphoneShop 
WHERE id LIKE '%Samsung%' OR manufacturer LIKE '%Samsung%' OR model_name LIKE '%Samsung%' OR quantity LIKE '%Samsung%' OR price LIKE '%Samsung%';
SELECT * FROM Homework1SmatphoneShop
 WHERE id LIKE '%iPhone%' OR manufacturer LIKE '%iPhone%' OR model_name LIKE '%iPhone%' OR quantity LIKE '%iPhone%' OR price LIKE'iPhone%';
SELECT * FROM Homework1SmatphoneShop 
WHERE id LIKE '%8%' OR manufacturer LIKE '%8%' OR model_name LIKE '%8%' OR quantity LIKE '%8%' OR price LIKE '%8%';

-- Homework 2
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



