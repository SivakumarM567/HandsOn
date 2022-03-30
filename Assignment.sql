create database HandsOn

use HandsOn
--1. Write a query to display the columns in a specific order like order date, salesman id, order number and purchase amount from for all the orders

select * from Orders order by Order_No

--2. write a SQL query to find the unique salespeople ID. Return salesman_id.

select SalesMan_ID from SalesMan where Name = 'Mc Lyon'

--3. write a SQL query to find the salespeople who lives in the City of 'Paris'. Return salesperson's name, city

select Name,city from SalesMan where city = 'Paris'

--4. write a SQL query to find the orders, which are delivered by a salesperson of ID. 5001. Return ord_no, ord_date, purch_amt

select Order_No,Order_Date,purchase_Amt from Orders where SalesMan_ID = 5001

--5.5.write a SQL query to find all the customers in ‘New York’ city who have a grade value above 100. Return customer_id, cust_name, city, grade, and salesman_id.

select Customer_ID,Customer_Name,city,Grade,SalesMan_ID from  Customer where city = 'New York' and Grade > 100

--6. write a SQL query to find the details of those salespeople whose commissions range from 0.10 to0.12. Return salesman_id, name, city, and commission

select SalesMan_ID,Name,city,Commission from SalesMan where Commission between 0.10 and 0.12

--7. 7.write a SQL query to calculate total purchase amount of all orders. Return total purchase amount.

select sum(purchase_Amt) Total_Purchase_Amt from Orders

--8. write a SQL query to calculate average purchase amount of all orders. Return average purchase amount.

select avg(purchase_Amt) Avg_Purchase_Amt from Orders

--9. write a SQL query to count the number of unique salespeople. Return number of salespeople.

select count(SalesMan_ID) NO_of_Salespeople from SalesMan

--10 write a SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase amount

select Customer_ID,max(purchase_Amt) Max_purchase_Amt from Orders group by Customer_ID order by Customer_ID

--11. 11.write a SQL query to find the highest purchase amount ordered by each customer on a particular date. Return, order date and highest purchase amoun

select Order_Date,max(purchase_Amt) Max_purchase_Amt from Orders group by Order_Date

--12. write a SQL query to find the highest purchase amount on '2012-08-17' by each salesperson. Return salesperson ID, purchase amount.

select SalesMan_ID,max(purchase_Amt) from Orders where Order_Date = '2012-08-17' group by SalesMan_ID

--13. 13.write a SQL query to find the salesperson and customer who belongs to same city. Return Salesman, cust_name and city.

select SalesMan.Name "Salesman",Customer.Customer_Name from SalesMan,Customer where SalesMan.City = Customer.city

--14. write a SQL query to find those orders where order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city

select Orders.Order_No,Orders.purchase_Amt,Customer.Customer_Name,Customer.city from Orders,Customer where purchase_Amt between 500 and 2000

--15. write a SQL query to find those salespersons who received a commission from the company more than 12%. Return Customer Name, customer city, Salesman, commission

select Customer.Customer_Name,Customer.city,SalesMan.Name "Salesman",SalesMan.Commission from Customer,SalesMan where Commission > 0.12

--16. write a SQL query to display the cust_name, customer city, grade, Salesman, salesman city. The result should be ordered by ascending on customer_id.

select Customer.Customer_Name,Customer.city,Customer.Grade,SalesMan.Name "Salesman",SalesMan.City from Customer,SalesMan order by Customer_ID 
