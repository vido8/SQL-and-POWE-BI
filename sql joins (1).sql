create database dummy_db;  
use dummy_db;
drop database dummy_db;
create table customer_details (
CustomerID INT PRIMARY KEY,
CustomerName varchar(20),
City varchar(20));
select * from customer_details;
insert into customer_details( CustomerID , CustomerName , City) values(5),
(1,'John Smith' ,'New York'),
(2, 'Mary Johnson' , 'Chicago'),
(3, 'Peter Adams' , 'Los Angeles'),
(4, 'Nancy Miller' , 'Houston'),
(5, 'Robert White' , 'Miami');
select * from customer_details;
create table customer_details (
CustomerID INT PRIMARY KEY,
CustomerName varchar(20),
City varchar(20));
select * from customer_details;
insert into customer_details   ( CustomerID , CustomerName , City) values(5),
(1,'John Smith' ,'New York'),
(2, 'Mary Johnson' , 'Chicago'),
(3, 'Peter Adams' , 'Los Angeles'),
(4, 'Nancy Miller' , 'Houston'),
(5, 'Robert White' , 'Miami');
select * from customer_details;
create table Orders(
OrderID INT,
CustomerID INT, 
primary key( OrderID , CustomerID),
OrderDate date, 
Amount decimal(10,2));
use  dummy_db;
select * from Orders;
use dummy_db;
INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount)
VALUES
(101, 1, '2024-10-01', 250),
(102, 2, '2024-10-05', 300),
(103, 1, '2024-10-07', 150),
(104, 3, '2024-10-10', 450),
(105, 6, '2024-10-12', 400);
select * from Orders;
drop table if exists payments;
create table Payments(
PaymentID varchar(20) ,
CustomerID INT primary key,
PaymentDate date,
Amount decimal(10,2));
use  dummy_db;
select * from Payments;
insert into Payments(PaymentID , CustomerID , PaymentDate  , Amount)
values
('P001' , 1 , '2024-10-02' , 250),
('P002' , 2 , '2024-10-06' , 300),
('P003' , 3 , '2024-10-11', 450),
('P004' , 4 , '2024-10-15' ,200);
use dummy_db;
select * from Payments;
create table Employees(
 EmployeeID int primary key,
 ManagerID INT,
EmployeeName varchar(50),
foreign key(managerID) References Employees(EmployeeID));
use  dummy_db;
select * from Employees;
insert into Employees (EmployeeID , EmployeeName , ManagerID)
values
(1 , 'Alex Green', NULL),
(2 , 'Brian Lee' , 1),
(3 , 'Carol Ray' , 1),
(4 , 'David Kim' , 2),
(5 ,'Eva Smith' ,  2);
use dummy_db;
select * from Employees;
drop table if exists Employees;
#Question 1. Retrieve all customers who have placed at least one order.
use dummy_db;
Select distinct  Customer_details.CustomerName,customer_details.customerID
FROM customer_details
INNER JOIN Orders ON customer_details.CustomerID = Orders.CustomerID;
 #Question 2. Retrieve all customers and their orders, including customers who have not placed any orders.
 use dummy_db;
select  customer_details.customerName, Orders.OrderID ,orders.Amount 
from customer_details
left join orders on customer_details.customerID = Orders.customerID;
 #Question 3. Retrieve all orders and their corresponding customers, including orders placed by unknown customers.
 USE dummy_db;
select   Orders.OrderID , orders.Amount , customer_details.customerName 
from customer_details
Right join Orders on customer_details.customerID = Orders.customerID;
#Question 4. Display all customers and orders, whether matched or not.
use dummy_db;
 select customer_details.customerID,
 customer_details.customerName,orders.OrderID
 from customer_details
 join Orders on customer_details.customerID = Orders.CustomerID
union
 select customer_details.customerID,
 customer_details.customerName,orders.OrderID
 from customer_details
 right join Orders on customer_details.customerID = Orders.CustomerID;
 #Question 5. Find customers who have not placed any orders.
 SELECT customer_details.CustomerID,
       customer_details.CustomerName
FROM customer_details
LEFT JOIN Orders
ON customer_details.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL;
 #Question 6. Retrieve customers who made payments but did not place any orders.
 SELECT DISTINCT customer_details.CustomerID,customer_details.CustomerName,Payments.Amount
FROM Payments
INNER JOIN customer_details
ON Payments.CustomerID = customer_details.CustomerID
LEFT JOIN Orders
ON Payments.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL;
 #Question 7. Generate a list of all possible combinations between Customers and Orders.
 SELECT customer_details.customerid, customer_details.customername,orders.orderid,orders.orderdate
FROM customer_details
CROSS JOIN orders;
 #Question 8. Show all customers along with order and payment amounts in one table.
 use dummy_db;
SELECT customer_details.CustomerID,ustomer_details.CustomerName,Orders.OrderID,Orders.Amount , Payments.PaymentID,Payments.Amount AS PaymentAmount
FROM Customer_details
LEFT JOIN Orders
ON Customer_details.CustomerID = Orders.CustomerID
LEFT JOIN Payments
    ON Customer_details.CustomerID = Payments.CustomerID;
 #Question 9. Retrieve all customers who have both placed orders and made payments.
use dummy_db;
SELECT DISTINCT
    Customer_details.CustomerID,
    Customer_details.CustomerName
FROM Customer_details
INNER JOIN Orders
    ON Customer_details.CustomerID = Orders.CustomerID
INNER JOIN Payments
    ON Customer_details.CustomerID = Payments.CustomerID;
 