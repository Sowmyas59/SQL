drop table Salesman
CREATE TABLE Salesman(salesman_id int primary key, 
name varchar(100), 
city varchar(50), 
commission float)
INSERT INTO Salesman values(5001, 'James Hoog','New York', 0.15)
INSERT INTO Salesman values(5002, 'Nail Knite','Paris', 0.13)
INSERT INTO Salesman values(5005, 'Pit Alex','London', 0.11)
INSERT INTO Salesman values(5006, 'Mc Lyon','Paris', 0.14)
INSERT INTO Salesman values(5007, 'Paul Adam','Rome', 0.13)
INSERT INTO Salesman values(5003, 'Lauson Hen','San Jose', 0.12)
Select * from Salesman

DROP TABLE Customer
CREATE TABLE Customer(Customer_id int primary key, 
Cust_name varchar(50), 
city varchar(50), 
grade int, 
salesman_id int FOREIGN KEY references Salesman(salesman_id))

INSERT INTO Customer values(3002, 'Nick Rimando', 'New York', 100, 5001)
INSERT INTO Customer values(3007, 'Brad Davis', 'New York', 200, 5001)
INSERT INTO Customer values(3005, 'Graham Zusi', 'California', 200, 5002)
INSERT INTO Customer values(3008, 'Julian Green', 'London', 300, 5002)
INSERT INTO Customer values(3004, 'Fabian Johnson', 'Paris', 300, 5006)
INSERT INTO Customer values(3009, 'Geoff Cameron', 'Berlin', 100, 5003)
INSERT INTO Customer values(3003, 'Jozy Altidor', 'Moscow', 200, 5007)
INSERT INTO Customer values(3001, 'Brad Guzan', 'London', NULL, 5005)
SELECT * from Customer

DROP TABLE Orders
CREATE TABLE Orders(ord_no int primary key, 
purch_amt money, 
ord_date date, 
Customer_id int FOREIGN KEY references Customer(Customer_id),
salesman_id int FOREIGN KEY references Salesman(salesman_id))

INSERT INTO Orders values(70001, 150.5,   '2012-10-05', 3005, 5002)
INSERT INTO Orders values(70009, 270.65,  '2012-09-10', 3001, 5005)
INSERT INTO Orders values(70002, 65.26,   '2012-10-05', 3002, 5001)
INSERT INTO Orders values(70004, 110.5,   '2012-08-17', 3009, 5003)
INSERT INTO Orders values(70007, 948.5,   '2012-09-10', 3005, 5002)
INSERT INTO Orders values(70005, 2400.5,  '2012-07-27', 3007, 5001)
INSERT INTO Orders values(70008, 5760,    '2012-09-10', 3002, 5001)
INSERT INTO Orders values(70010, 1983.43, '2012-10-10', 3004, 5006)
INSERT INTO Orders values(70003, 2480.4,  '2012-10-10', 3009, 5003)
INSERT INTO Orders values(70012, 250.45,  '2012-06-27', 3008, 5002)
INSERT INTO Orders values(70011, 75.29,   '2012-08-17', 3003, 5007)
INSERT INTO Orders values(70013, 3045.6,  '2012-04-25', 3002, 5001)
SELECT * FROM Orders

--Query 1--
SELECT * FROM Salesman

--Query 2--
SELECT Salesman_id, commission FROM Salesman

--Query 3--
SELECT ord_date, Salesman_id, ord_no, purch_amt FROM Orders

--Query 4--
SELECT Salesman_id, city FROM Salesman WHERE city='Paris'

--Query 5--
SELECT Customer_id, cust_name, city, grade, Salesman_id FROM Customer WHERE grade=200

--Query 6--
SELECT ord_no, ord_date, purch_amt FROM Orders WHERE salesman_id=5001

--Queries--
--1--
SELECT avg(purch_amt) as 'avgamt' FROM Orders

--2--
SELECT COUNT(name) as 'name' FROM Salesman

--3--
SELECT COUNT(cust_name) as 'cust_name' FROM Customer

--4--
SELECT MAX(purch_amt) as 'amount' FROM Orders

--5--
SELECT city, MAX(grade) as 'grade' FROM Customer GROUP BY city

--6--
SELECT Customer_id, MAX(purch_amt) as 'purc_amt' FROM Orders GROUP BY Customer_id