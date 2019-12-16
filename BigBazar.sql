PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Supplier (
  Supplier_ID varchar(10) NOT NULL,
  Supplier_Name varchar(50) DEFAULT NULL,
  PRIMARY KEY (Supplier_ID)
);
INSERT INTO "Supplier" VALUES('S101','Shoba Traders');
INSERT INTO "Supplier" VALUES('S102','Electro Vision');
INSERT INTO "Supplier" VALUES('S103','Priya Pickles');
INSERT INTO "Supplier" VALUES('S104','Vinay Furnitures');
INSERT INTO "Supplier" VALUES('S105','Mahindra Tractors');
INSERT INTO "Supplier" VALUES('S106','Yamini Exports');
INSERT INTO "Supplier" VALUES('S107','DCMS');
INSERT INTO "Supplier" VALUES('S108','Venkat Books');
INSERT INTO "Supplier" VALUES('S109','Mounika Chocolate Factory');
CREATE TABLE Customer (
  Customer_ID varchar(10) NOT NULL,
  Customer_Name varchar(50) DEFAULT NULL,
  PRIMARY KEY (Customer_ID)
);
INSERT INTO "Customer" VALUES('C0101','Mounika');
INSERT INTO "Customer" VALUES('C0102','Seetha');
INSERT INTO "Customer" VALUES('C0103','Rajesh');
INSERT INTO "Customer" VALUES('C0104','Rakesh');
INSERT INTO "Customer" VALUES('C0105','Sailaja');
INSERT INTO "Customer" VALUES('C0106','Kumari');
INSERT INTO "Customer" VALUES('C0107','Dhana sri');
CREATE TABLE Cashier (
  Cashier_ID varchar(10) NOT NULL,
  Cashier_Name varchar(50) DEFAULT NULL,
  PRIMARY KEY (Cashier_ID)
);
INSERT INTO "Cashier" VALUES('1001','Raghu');
INSERT INTO "Cashier" VALUES('1002','Ravi');
INSERT INTO "Cashier" VALUES('1003','Bhanu');
INSERT INTO "Cashier" VALUES('1004','Kumari');
INSERT INTO "Cashier" VALUES('1005','Hema');
INSERT INTO "Cashier" VALUES('1006','Yamini');
CREATE TABLE Bill_Details (
  Bill_Number varchar(10),
  Item_ID varchar(10),
  Sold_Quantity int default 1,
  FOREIGN KEY (Bill_Number) REFERENCES Bill_Header (Bill_Number),
  FOREIGN KEY (Item_ID) REFERENCES Items (Item_ID)
);
INSERT INTO Bill_Details VALUES('BN1401','IT101',1);
INSERT INTO Bill_Details VALUES('BN1401','SP302',1);
INSERT INTO Bill_Details VALUES('BN1403','AB201',20);
INSERT INTO Bill_Details VALUES('BN1403','AB203',30);
INSERT INTO Bill_Details VALUES('BN1404','IT104',1);
INSERT INTO Bill_Details VALUES('BN1408','SP303',2);
INSERT INTO Bill_Details VALUES('BN1401','AB201',3);
INSERT INTO Bill_Details VALUES('BN1408','SP306',1);
INSERT INTO Bill_Details VALUES('BN1408','AB201',20);
INSERT INTO Bill_Details VALUES('BN1403','AB201',20);
INSERT INTO Bill_Details VALUES('BN1408','AB203',5);
INSERT INTO Bill_Details VALUES('BN1408','IT103',2);
INSERT INTO Bill_Details VALUES('BN1403','SP304',1);
INSERT INTO Bill_Details VALUES('BN1404','SP306',5);
INSERT INTO Bill_Details VALUES('BN1404','AB202',50);
INSERT INTO Bill_Details VALUES('BN1408','AB202',5);
CREATE TABLE Bill_Header (
  Bill_Number varchar(10),
  Bill_Date varchar(20),
  Customer_ID varchar(10),
  Cashier_ID varchar(10),
  PRIMARY KEY (Bill_Number),
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
  FOREIGN KEY (Cashier_ID) REFERENCES Cashier(Cashier_ID)
);
INSERT INTO "Bill_Header" VALUES('BN1401','26/10/19','C0101','1003');
INSERT INTO "Bill_Header" VALUES('BN1403','26/10/19','C0102','1001');
INSERT INTO "Bill_Header" VALUES('BN1404','28/10/19','C0103','1001');
INSERT INTO "Bill_Header" VALUES('BN1408','28/10/19','C0101','1004');
CREATE TABLE Items (
  Item_ID varchar(10),
  Item_Description varchar(50),
  Unit_Price float NOT NULl,
  Stock_Quantity int DEFAULT NULL,
  Supplier_ID varchar(10),
  Reorder_Level int DEFAULT '400',
  Order_Status int DEFAULT '0',
  PRIMARY KEY (`Item_ID`),
  FOREIGN KEY (`Supplier_ID`) REFERENCES `Supplier` (`Supplier_ID`)
);
INSERT INTO Items VALUES('AB201','Priya Tomato Pickle',80.0,400,'S103',400,0);
INSERT INTO Items VALUES('AB202','Yamini Ginger Pickle',100.0,25,'S103',400,1);
INSERT INTO Items VALUES('AB203','Mounika Coriender Pickle',70.0,25,'S106',400,1);
INSERT INTO Items VALUES('IT101','Prestige Gas Stove',5000.0,18,'S101',400,1);
INSERT INTO Items VALUES('IT102','Preethi Zodiac',3000.0,30,'S101',400,1);
INSERT INTO Items VALUES('IT103','Panasonic Cooker',2000.0,46,'S102',400,1);
INSERT INTO Items VALUES('It104','Butterfly Mixer Grinder',2500.0,13,'S102',400,1);
INSERT INTO Items VALUES('RS401','Fridge',25000.0,30,'S102',400,1);
INSERT INTO Items VALUES('RS402','Air Conditioner',45000.0,20,'S102',400,1);
INSERT INTO Items VALUES('SP301','Oxford Idioms',385.0,10,'S107',400,1);
INSERT INTO Items VALUES('SP302','Ramayana',1000.0,8,'S107',400,1);
INSERT INTO Items VALUES('SP303','Oxford Phrasal Verbs',350.0,28,'S107',400,1);
INSERT INTO Items VALUES('SP304','Android Development',700.0,5,'S108',400,1);
INSERT INTO Items VALUES('SP305','Science And Technology',980.0,7,'S108',400,1);
INSERT INTO Items VALUES('SP306','DBMS',585.0,12,'S108',400,1);
COMMIT;
