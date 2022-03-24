create database HandsOn

use HandsOn

create table SalesMan(SalesMan_ID numeric(5) primary key,Name varchar(30),City varchar(15),Commission decimal(5,2))
create table Customer(Customer_ID numeric(5) primary key,Customer_Name varchar(30),city varchar(15),Grade numeric(3),SalesMan_ID numeric(5) references SalesMan(SalesMan_ID))
create table Orders(Order_No numeric(5)primary key,purchase_Amt decimal(8,2),Order_Date date,Customer_ID numeric(5) references Customer(Customer_ID),SalesMan_ID numeric(5) references SalesMan(SalesMan_ID))


insert into SalesMan values(5001,'James Hoog','New York',0.15)
insert into SalesMan values(5002,'Nail Knite','Paris',0.13)
insert into SalesMan values(5005,'Pit Alex','London',0.11)
insert into SalesMan values(5006,'Mc Lyon','Paris',0.14)
insert into SalesMan values(5007,'Paul Adam','ROme',0.14)
insert into SalesMan values(5003,'Lauson Hen','San Jose',0.12)

insert into Orders values(70001,150.5,'2012-10-05',3005,5002)
insert into Orders values(70009,270.65,'2012-09-10',3001,5005)
insert into Orders values(70002,65.26,'2012-10-05',3002,5001)
insert into Orders values(70004,110.5,'2012-08-17',3009,5003)
insert into Orders values(70007,948.5,'2012-09-10',3005,5002)
insert into Orders values(70005,2400.6,'2012-07-27',3007,5001)
insert into Orders values(70008,5760,'2012-09-10',3002,5001)
insert into Orders values(70010,1983.43,'2012-10-10',3004,5006)
insert into Orders values(70003,2480.4,'2012-10-10',3009,5003)
insert into Orders values(70012,250.45,'2012-06-27',3008,5002)
insert into Orders values(70011,75.29,'2012-08-17',3003,5007)
insert into Orders values(70013,3045.6,'2012-04-25',3002,5001)

insert into Customer values(3002,'Nick Rimando','New York',100,5001)
insert into Customer values(3007,'Brad Davis','New York',200,5001)
insert into Customer values(3005,'Graham Zusi','California',200,5002)
insert into Customer values(3008,'Julian Green' ,'London'     ,300 ,5002)
insert into Customer values(3004 ,'Fabian Johnson' ,'Paris'    , 300,     5006)
insert into Customer values(3009 ,'Geoff Cameron'  , 'Berlin'     ,   100 ,        5003)
insert into Customer values(3003 , 'Jozy Altidor'   , 'Moscow'     ,   200 ,        5007)
insert into Customer (Customer_ID,Customer_Name,city,SalesMan_ID) values(3001 , 'Brad Guzan'     , 'London'     ,        5005)

select * from Orders order by Order_No

select SalesMan_ID from SalesMan where Name = 'Mc Lyon'

select Name,city from SalesMan where city = 'Paris'

select Order_No,Order_Date,purchase_Amt from Orders where SalesMan_ID = 5001

select Customer_ID,Customer_Name,city,Grade,SalesMan_ID from  Customer where city = 'New York' and Grade > 100

select SalesMan_ID,Name,city,Commission from SalesMan where Commission between 0.10 and 0.12

select sum(purchase_Amt) Total_Purchase_Amt from Orders

select avg(purchase_Amt) Avg_Purchase_Amt from Orders

select count(SalesMan_ID) NO_of_Salespeople from SalesMan

select Customer_ID,max(purchase_Amt) Max_purchase_Amt from Orders group by Customer_ID order by Customer_ID

select Order_Date,max(purchase_Amt) Max_purchase_Amt from Orders group by Order_Date

select SalesMan_ID,max(purchase_Amt) from Orders where Order_Date = '2012-08-17' group by SalesMan_ID

select SalesMan.Name "Salesman",Customer.Customer_Name from SalesMan,Customer where SalesMan.City = Customer.city

select Orders.Order_No,Orders.purchase_Amt,Customer.Customer_Name,Customer.city from Orders,Customer where purchase_Amt between 500 and 2000

select Customer.Customer_Name,Customer.city,SalesMan.Name "Salesman",SalesMan.Commission from Customer,SalesMan where Commission > 0.12

select Customer.Customer_Name,Customer.city,Customer.Grade,SalesMan.Name "Salesman",SalesMan.City from Customer,SalesMan order by Customer_ID 

select * from orders Where SalesMan_ID = (select SalesMan_ID from SalesMan where Name = 'Paul Adam')

select * from orders Where SalesMan_ID = (select SalesMan_ID from SalesMan where City = 'London')

select * from orders Where SalesMan_ID = (Select SalesMan_ID from Orders where Customer_ID = 3007)

select * from orders Where purchase_Amt > (select avg(purchase_Amt) from Orders where Order_Date = '10-10-2012')
