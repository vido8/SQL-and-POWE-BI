create database company_db;
drop database company_db;
use company_db;  
create table employees(
employee_id int primary key,
first_name varchar(50),
last_name varchar(50),
department varchar(50),
salary int,
hire_date date);
insert into employees( employee_id,first_name,last_name,department,salary,hire_date)
values
(101, 'Amit', 'Sharma', 'HR', 50000, '2020-01-15'),
(102, 'Riya', 'Kapoor', 'Sales', 75000, '2019-03-22'),
(103, 'Raj','Mehta', 'IT', 90000, '2018-07-11'),
(104, 'Neha', 'Verma', 'IT', 85000, '2021-09-01'),
(105, 'Arjun', 'Singh', 'Finance', 60000, '2022-02-10');
select * from employees;
# Q3). Display All Employee Records Sorted by Salary (Lowest to Highest)
select * from employees
order by Salary asc;
# Q4)Show Employees Sorted by Department (A–Z) and Salary (High → Low)
select * from employees
order by department asc,
salary desc;
# Q5)List All Employees in the IT Department, Ordered by Hire Date (Newest First)
select * from employees
where department='HR'
order by hire_date desc;
# Q6. Create and Populate a Sales Table Task: Create a table  sales sale_id to track sales data:
use company_db;
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    amount INT,
    sale_date DATE
);
INSERT INTO sales VALUES
(1, 'Aditi', 1500, '2024-08-01'),
(2, 'Rohan', 2200, '2024-08-03'),
(3, 'Aditi', 3500, '2024-09-05'),
(4, 'Meena', 2700, '2024-09-15'),
(5, 'Rohan', 4500, '2024-09-25');
select * from sales
ORDER BY amount DESC;
# Q8) Show All Sales Made by Customer “Aditi” Hint: Use WHERE customer_name = 'Aditi'.
select * from sales
where  customer_name='Aditi';
