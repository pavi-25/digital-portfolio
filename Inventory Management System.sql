create database InventoryDB;
use InventoryDB;

CREATE TABLE Category(
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(50)
);

INSERT INTO Category VALUES
(1,'Electronics'),
(2,'Groceries'),
(3,'Stationery'),
(4,'Furniture'),
(5,'Accessories');

CREATE TABLE Supplier(
    Supplier_ID INT PRIMARY KEY,
    Supplier_Name VARCHAR(50),
    Phone VARCHAR(15),
    City VARCHAR(30)
);

INSERT INTO Supplier VALUES
(101,'ABC Traders','9876543210','Chennai'),
(102,'XYZ Suppliers','9876543211','Madurai'),
(103,'Global Stores','9876543212','Coimbatore'),
(104,'Sun Traders','9876543213','Trichy'),
(105,'Smart Supply','9876543214','Salem');

CREATE TABLE Product(
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Category_ID INT,
    Supplier_ID INT,
    Price DECIMAL(10,2),
    Stock_Qty INT,
    FOREIGN KEY(Category_ID) REFERENCES Category(Category_ID),
    FOREIGN KEY(Supplier_ID) REFERENCES Supplier(Supplier_ID)
);

INSERT INTO Product VALUES
(1,'Laptop',1,101,50000,10),
(2,'Mouse',1,101,500,50),
(3,'Keyboard',1,101,1000,40),
(4,'Monitor',1,101,12000,15),
(5,'Printer',1,101,8000,8),
(6,'Rice Bag',2,102,1200,30),
(7,'Sugar',2,102,60,100),
(8,'Wheat Flour',2,102,70,80),
(9,'Cooking Oil',2,102,180,60),
(10,'Salt',2,102,20,150),
(11,'Notebook',3,103,50,200),
(12,'Pen',3,103,10,500),
(13,'Pencil',3,103,5,600),
(14,'Eraser',3,103,3,400),
(15,'Scale',3,103,15,250),
(16,'Chair',4,104,2500,20),
(17,'Table',4,104,5000,10),
(18,'Cupboard',4,104,12000,5),
(19,'Sofa',4,104,25000,3),
(20,'Bookshelf',4,104,7000,7),
(21,'USB Drive',5,105,800,25),
(22,'Power Bank',5,105,1500,18),
(23,'Headphones',5,105,2000,22),
(24,'Charger',5,105,700,35),
(25,'Mobile Cover',5,105,300,50),
(26,'Webcam',1,101,2500,12),
(27,'Speaker',1,101,3000,14),
(28,'Router',1,101,2200,16),
(29,'Projector',1,101,25000,4),
(30,'Scanner',1,101,6500,6),
(31,'Tea Powder',2,102,250,40),
(32,'Coffee Powder',2,102,350,35),
(33,'Milk Powder',2,102,450,20),
(34,'Marker',3,103,25,180),
(35,'Sketch Pen',3,103,80,120),
(36,'White Board',3,103,900,15),
(37,'Office Chair',4,104,4500,10),
(38,'Study Table',4,104,5500,8),
(39,'Bluetooth Speaker',5,105,1800,20),
(40,'Earbuds',5,105,2200,18);

CREATE TABLE Customer(
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Phone VARCHAR(15),
    City VARCHAR(30)
);

INSERT INTO Customer VALUES
(1,'Arun','9876543210','Chennai'),
(2,'Karthik','9876543211','Madurai'),
(3,'Priya','9876543212','Coimbatore'),
(4,'Divya','9876543213','Trichy'),
(5,'Vijay','9876543214','Salem'),
(6,'Ravi','9876543215','Erode'),
(7,'Meena','9876543216','Chennai'),
(8,'Suresh','9876543217','Madurai'),
(9,'Anitha','9876543218','Vellore'),
(10,'Hari','9876543219','Tirunelveli'),
(11,'Kumar','9876543220','Chennai'),
(12,'Nisha','9876543221','Coimbatore'),
(13,'Deepak','9876543222','Trichy'),
(14,'Keerthi','9876543223','Salem'),
(15,'Prakash','9876543224','Erode'),
(16,'Lavanya','9876543225','Vellore'),
(17,'Ajith','9876543226','Madurai'),
(18,'Monika','9876543227','Chennai'),
(19,'Sanjay','9876543228','Trichy'),
(20,'Renu','9876543229','Coimbatore');

CREATE TABLE Orders(
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID)
);

INSERT INTO Orders VALUES
(101,1,'2026-06-01'),
(102,2,'2026-06-02'),
(103,3,'2026-06-03'),
(104,4,'2026-06-04'),
(105,5,'2026-06-05'),
(106,6,'2026-06-06'),
(107,7,'2026-06-07'),
(108,8,'2026-06-08'),
(109,9,'2026-06-09'),
(110,10,'2026-06-10'),
(111,11,'2026-06-11'),
(112,12,'2026-06-12'),
(113,13,'2026-06-13'),
(114,14,'2026-06-14'),
(115,15,'2026-06-15'),
(116,16,'2026-06-16'),
(117,17,'2026-06-17'),
(118,18,'2026-06-18'),
(119,19,'2026-06-19'),
(120,20,'2026-06-20');
CREATE TABLE Order_Details(
    Detail_ID INT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    FOREIGN KEY(Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY(Product_ID) REFERENCES Product(Product_ID)
);

INSERT INTO Order_Details VALUES
(21,101,21,2),
(22,102,22,1),
(23,103,23,3),
(24,104,24,2),
(25,105,25,1),
(26,106,26,2),
(27,107,27,1),
(28,108,28,1),
(29,109,29,1),
(30,110,30,2),
(31,111,31,3),
(32,112,32,1),
(33,113,33,2),
(34,114,34,4),
(35,115,35,1),
(36,116,36,2),
(37,117,37,1),
(38,118,38,1),
(39,119,39,2),
(40,120,40,1);

-- Select 
select * from Product;
select * from Customer;
select * from Supplier;
select * from Category;
select * from Orders;
select * from Order_Details;

select count(*) from Customer;
select distinct Customer_Name from Customer;
select Customer_Name from Customer where City="chennai";
select Product_Name,Stock_Qty from Product order by Stock_Qty desc;
select Customer_Name from Customer where  Customer_ID= 7 and  City= "chennai";

-- Alter 
alter table Product add Brand Varchar(30);
select*from Product;
alter table Product drop column Brand;

-- Update
update Product set Stock_Qty=26 where Product_ID=4;
select*from Product;
update Customer set City="Velacherry" where Customer_ID=5;
select* from Customer;

-- Delete
delete from Product  Where Product_ID=10;
select* from Product;
-- OR
select * from Product where Price>10000 or Stock_Qty<20;
select * from Customer where City="chennai" or city="maduari";
-- Not
select *from Product Where not Category_ID=1;
select * from Customer  where not  City="chennai";

-- Aggregate Functions
select max(price) from  Product;
select max(Stock_Qty) from Product;
select min(price) from Product;
select min(Stock_Qty) from Product;
select count(*) from Product;
select  count(*) from Customer; 
select  sum(Stock_Qty) from Product;
select  sum(Price) from Product;
select  avg(Price) from Product;
select  avg(Stock_Qty) from Product;
select  avg(Stock_Qty) from Product;

-- Like
select* from Customer where Customer_Name like '%a' or '%i';
select* from Customer where Customer_Name like '%a' or 'i%';
select* from Product where Product_Name like '%ar%';
select* from  Product where Product_Name like '_s%';

-- In
select* from Product where Category_ID in (1,2,3);
select* from Customer where City in ("velacherry","madurai");

-- Between
select* from Product where Price between 1000 and 10000;
select* from Orders where Order_Date between '2026-06-01' and '2026-06-10';

select Product_Name as Product,Price as Cost From Product;
Select Customer_Name as Customer from Customer;

-- Joins
select* from Orders O, Customer C where O.Customer_ID=C.Customer_ID;
-- inner join
select C.Customer_Name, O.Order_ID from Customer C inner join Orders O On C.Customer_ID=O.Customer_ID;
select P.Product_Name, S.Supplier_Name from Product P  inner join Supplier S On P.Supplier_ID=S.supplier_ID;
-- left Join
select C.Customer_Name,O.Order_ID from Customer C left join  Orders O on C.Customer_ID=O.Customer_ID;
select S.Supplier_Name,P.Product_Name from  Supplier S left join Product P on S.Supplier_ID=P.Supplier_ID;
-- Right join
select C.Customer_Name,O.Order_ID from Customer C right join Orders O on C.Customer_ID=O.Customer_ID;
select S.Supplier_Name,P.Product_Name from Supplier S right join Product P on S.Supplier_ID=P.Supplier_ID;
-- Union
select City from Customer union select City from Supplier;
select Customer_Name from Customer union  select Supplier_Name from Supplier;
-- Union All
select City from Customer union all select City from Supplier;
select Customer_Name from Customer union all select Supplier_Name from Supplier;

-- Group By
select Category_ID,count(*) from Product group by Category_ID;
select City,count(*) from Customer group by City;

-- Having
select Category_ID,count(*) from Product group by Category_ID having COUNT(*)>5;
select City,count(*) from Customer group by City having COUNT(*)>2;

-- All
select * from Product where Price > all (Select Price from Product where Category_ID=2);
select * from Product where Stock_Qty > all (select Stock_Qty from Product where Category_ID=3);

-- Any
select * from Product where Price > any (select Price from Product where Category_ID=2);
select * from Product where Stock_Qty > any (select Stock_Qty from Product where Category_ID=3);

-- SubQueries
select Product_Name,Price from Product where Price> (select avg(Price) from Product);
select * from Customer where Customer_ID in (select Customer_ID from Orders);
select * from Product where Price = ( select max(Price) from Product);
select Customer_Name from Customer where Customer_ID in ( select Customer_ID from Orders);
select Product_Name from Product where Supplier_ID = ( select Supplier_ID from Supplier where Supplier_ID = 101);

-- View
create view Product_View as select Product_ID,Product_Name,Price,Stock_Qty from Product;
select * from Product_View;

create view Customer_View as select Customer_Name from Customer ;
select * from Customer_View;

create view Product_Supplier_View as
select P.Proddct_Name,S.Supplier_Name,P.Price from Product P inner join Supplier S on P.Supplier_ID = S.Supplier_ID;
select * from Product_Supplier_View;

-- Index
create index idx_product_name
on Product(Product_Name);
create index idx_order_date
on Orders(Order_Date);
show index from Product;

-- Store Procedure
delimiter //

create procedure GetProducts()
begin
    select * from Product;
end //

delimiter ;
call GetProducts();

delimiter //

create procedure ProductByPrice(in price DECIMAL(10,2))
begin
    select * from Product where Price > p_price;
end //
delimiter ;
call GetProductById(5);

delimiter //

create procedure ProductByPrice(in pprice DECIMAL(10,2))
begin
    select * from Product where Price > price;
end //
DELIMITER ;

call ProductByPrice(5000);

-- Truncate
Truncate Table Product;
Truncate Table Customer;

-- Drop 
Drop database InventoryDB;


 


 





