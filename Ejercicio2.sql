USE master;

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'Products')
DROP DATABASE Products;

CREATE DATABASE Products;

USE Products;

CREATE TABLE Prices(
product_id INT NOT NULL IDENTITY(1,1),
start_date date NOT NULL UNIQUE,
end_date date NOT NULL UNIQUE,
price INT NOT NULL,
PRIMARY KEY(product_id)
);
CREATE TABLE UnitsSold(
Product_id INT NOT NULL,
purchase_date date NOT NULL,
units INT NOT NULL,
FOREIGN KEY (Product_id) REFERENCES Prices(product_id)
);
INSERT INTO Prices
([start_date],[end_date],[price])
VALUES
('2019-02-17','2019-03-08', 5),
('2019-02-01','2019-03-22', 20),
('2019-01-01','2019-03-10', 15),
('2017-01-21','2021-01-21', 30),
('2021-09-27','2022-08-16', 22),
('2022-10-13','2023-06-19', 48);
INSERT INTO UnitsSold
([Product_id], [purchase_date], [units])
VALUES 
(1, '2019-02-25', 100),
(1, '2019-03-01', 15),
(1, '2019-02-15', 18),
(2, '2019-02-10', 200),
(2, '2019-03-22', 30),
(3, '2019-02-25', 20),
(3, '2019-03-08', 32),
(3, '2019-02-15', 18),
(4, '2020-06-25', 180),
(4, '2018-03-11', 34),
(5, '2022-07-03', 18),
(5, '2022-07-15', 42),
(6, '2022-11-19', 150),
(6, '2022-11-03', 36); 

SELECT us.Product_id, (p.price*SUM(us.units))/SUM(us.units) as total_units
FROM  UnitsSold us CROSS JOIN Prices p  
WHERE us.Product_id=p.product_id 
GROUP BY us.Product_id, p.price;
	