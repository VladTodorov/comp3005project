DROP TABLE IF EXISTS Publisher CASCADE;
DROP TABLE IF EXISTS Customer CASCADE;
DROP TABLE IF EXISTS Book CASCADE;
DROP TABLE IF EXISTS Author CASCADE;
DROP TABLE IF EXISTS Genre CASCADE;
DROP TABLE IF EXISTS Phone CASCADE;
DROP TABLE IF EXISTS Customer_order CASCADE;
DROP TABLE IF EXISTS Checkout_basket CASCADE;
DROP TABLE IF EXISTS Restock_order CASCADE;
DROP TABLE IF EXISTS Supplier CASCADE;


CREATE TABLE IF NOT EXISTS Publisher (
	Email VARCHAR(40) UNIQUE, 
	Publisher_Name  VARCHAR(30), 
	Address VARCHAR(50), 
	Banking_account VARCHAR(25),
	PRIMARY KEY (Email)
);

CREATE TABLE IF NOT EXISTS Customer ( --aka User
	Username VARCHAR(30) UNIQUE, 
	Billing_information VARCHAR(30), 
	Shipping_information VARCHAR(30),
	PRIMARY KEY (Username)
);

CREATE TABLE IF NOT EXISTS Book (
	ISBN CHAR(13) UNIQUE,
	Title VARCHAR(100),
	Publisher VARCHAR(40),
	Number_pages INT,
	price NUMERIC(6,2),
	Quantity_in_stock INT,
	Percentage_sales_to_publishers NUMERIC(4, 2),
	Times_Sold INT,
	PRIMARY KEY (ISBN),
	FOREIGN KEY (Publisher) REFERENCES Publisher (Email)
);


CREATE TABLE IF NOT EXISTS Author (
	Book_id CHAR(13),
	Author_name VARCHAR(30),
	PRIMARY KEY (Book_id, Author_name),
	FOREIGN KEY (Book_id) REFERENCES Book (ISBN)
);

CREATE TABLE IF NOT EXISTS Genre (
	BookId CHAR(13),
	Genre VARCHAR(30),
	PRIMARY KEY (BookId, Genre),
	FOREIGN KEY (BookId) REFERENCES Book (ISBN)
);

CREATE TABLE IF NOT EXISTS Phone (
	P_id VARCHAR(40),
	Phone VARCHAR(14),
	PRIMARY KEY (P_id, Phone),
	FOREIGN KEY (P_id) REFERENCES Publisher (Email)
);

CREATE TABLE IF NOT EXISTS Customer_order (
	Order_num INT UNIQUE, 
	C_id VARCHAR(30), 
	B_id CHAR(13), 
	Delivery_location VARCHAR(30), 
	Latest_location VARCHAR(50),
	Quantity_ordered INT, 
	Order_billing_information VARCHAR(30),
	PRIMARY KEY (Order_num),
	FOREIGN KEY (C_id) REFERENCES Customer (Username),
	FOREIGN KEY (B_Id) REFERENCES Book (ISBN)
);

CREATE TABLE IF NOT EXISTS Checkout_basket (
	Cid VARCHAR(30),
	Bid CHAR(13),
	Book_amount INT,
	PRIMARY KEY (Cid, Bid),
	FOREIGN KEY (Cid) REFERENCES Customer (Username),
	FOREIGN KEY (BId) REFERENCES Book (ISBN)
);

CREATE TABLE IF NOT EXISTS Restock_order (
	Restock_order_num INT UNIQUE,
	B_isbn CHAR(13),
	Restock_amount INT,
	Restock_Completed BOOL,
	PRIMARY KEY (Restock_order_num),
	FOREIGN KEY (B_isbn) REFERENCES Book (ISBN)
);

CREATE TABLE IF NOT EXISTS Supplier (
	Bisbn CHAR(13),
	Pub_id VARCHAR(40), 
	PRIMARY KEY (Bisbn, Pub_id),
	FOREIGN KEY (Bisbn) REFERENCES Book (ISBN),
	FOREIGN KEY (Pub_id) REFERENCES Publisher (Email)
);


INSERT INTO Publisher VALUES
	('brothers.grimm@fairy.com', 'Brothers Grimm', '718 Crime rd. Vancouver, British Columbia', '001198651231283565'),
	('siglet@read.ca', 'Siglet Classics', '150 Roberts ave. Toronto, Ontario', '002174651974883512'),
	('wolfie@books.ca', 'Wolfie Books', '253 Link st. Ottawa, Ontario', '001123451231234567'),
	('kids.wolfie@books.ca', 'Wolfie Kids Books', '253 Link st. Ottawa, Ontario', '001123451231234567');

INSERT INTO Customer VALUES
	('Bobby', '315 Dos rd. Ottawa', '315 Dos rd. Ottawa'),
	('LostRex', '4519 Bright bul. Peater', '4519 Bright bul. Peater'),
	('Milky', '8898 Lincon st. E, Ottawa', '4652 Billar Ave. Edmonton');

INSERT INTO Book VALUES
	('9876543210743', 'Notes From the Underground', 'siglet@read.ca', 237, 5.00, 30, 35, 45),
	('9781451673319', 'Fahrenheit 451', 'wolfie@books.ca', 312, 9.99, 40, 32, 64),
	('9781443434973', '1984', 'siglet@read.ca', 416, 19.84, 37, 40, 77),
	('9780394800011', 'The Cat in the Hat', 'kids.wolfie@books.ca', 72, 21.89, 10, 30, 68);

INSERT INTO Author VALUES
	('9876543210743', 'Fyodor Dostoyevsky'),
	('9781451673319', 'Ray Bradbury'),
	('9781443434973', 'George Orwell'),
	('9780394800011', 'Dr. Seuss');

INSERT INTO Genre VALUES
	('9876543210743', 'Philosophical'),
	('9876543210743', 'Fiction'),
	('9876543210743', 'Novella'),
	('9781451673319', 'Fiction'),
	('9781451673319', 'Novel'),
	('9781451673319', 'Science fiction'),
	('9781451673319', 'Political fiction'),
	('9781451673319', 'Dystopian Fiction'),
	('9781443434973', 'Fiction'),
	('9781443434973', 'Dystopian Fiction'),
	('9781443434973', 'Political fiction'),
	('9781443434973', 'Science fiction'),
	('9780394800011', 'Children'),
	('9780394800011', 'Picture book'),
	('9780394800011', 'Fiction');

INSERT INTO Phone VALUES
	('brothers.grimm@fairy.com', '+16472835565'),
	('siglet@read.ca', '+14155883512'),
	('siglet@read.ca', '+3583419796457'),
	('wolfie@books.ca', '+14153123457'),
	('kids.wolfie@books.ca', '+17072345567');

INSERT INTO Customer_order VALUES
	(1001, 'Bobby', '9876543210743', '315 Dos rd. Ottawa', 'Package Has Arrived', 1, '315 Dos rd. Ottawa'),
	(1002, 'Milky', '9780394800011', '1125 Colonel By Dr, Ottawa', 'Package is preparing to be shipped', 15, '8898 Lincon st. E, Ottawa');

INSERT INTO Checkout_basket VALUES
	('Bobby', '9781451673319', 1),
	('Bobby', '9781443434973', 1),
	('LostRex', '9781451673319', 2);

INSERT INTO Restock_order VALUES
	(501, '9781451673319', 20, TRUE),
	(502, '9781443434973', 20, TRUE),
	(503, '9780394800011', 20, FALSE);

INSERT INTO Supplier VALUES
	('9876543210743', 'siglet@read.ca'),
	('9781451673319', 'wolfie@books.ca'),
	('9781443434973', 'siglet@read.ca'),
	('9780394800011', 'kids.wolfie@books.ca');

