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






