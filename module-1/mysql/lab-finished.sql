CREATE TABLE Cars (
  ID int NOT NULL,
  VIN varchar(50) NOT NULL,
  Manufacturer varchar(50) NOT NULL,
  Model varchar(50) NOT NULL,
  "Year" int NOT NULL,
  Color varchar(50) NOT NULL
);

INSERT INTO Cars
VALUES (0, '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue');
INSERT INTO Cars
VALUES (1, 'ZM8G7BEUQZ97IH46V','Peugeot','Rifter',2019,'Red');
INSERT INTO Cars
VALUES (2, 'RKXVNNIHLVVZOUB4M','Ford','Fusion',2018,'White');
INSERT INTO Cars
VALUES (4, 'DAM41UDN3CHU2WVF6','Volvo','V60',2019,'Gray');
INSERT INTO Cars
VALUES (5, 'DAM41UDN3CHU2WVF6','Volvo','V60 Cross Country',2019,'Gray');

CREATE TABLE Salespersons (
  ID int,
  Staff_ID varchar(5),
  Name varchar(50),
  Store varchar(50)
);

INSERT INTO Salespersons
VALUES (0,'00001','Petey Cruiser','Madrid');
INSERT INTO Salespersons
VALUES (1,'00002','Anna Sthesia','Barcelona');
INSERT INTO Salespersons
VALUES (2,'00003','Paul Molive','Berlin');
INSERT INTO Salespersons
VALUES (3,'00004','Gail Forcewind','Paris');
INSERT INTO Salespersons
VALUES (4,'00005','Paige Turner','Mimia');
INSERT INTO Salespersons
VALUES (5,'00006','Bob Frapples','Mexico City');
INSERT INTO Salespersons
VALUES (6,'00007','Walter Melon','Amsterdam');
INSERT INTO Salespersons
VALUES (7,'00008','Shonda Leer','São Paulo');

CREATE TABLE Customers (
  ID int,
  "Customer ID" varchar(5),
  Name text,
  Phone varchar(50),
  Email varchar(50),
  Address varchar(50),
  City varchar(50), 
  "State/Province" varchar(50),
  Country varchar(50),
  Postal varchar(5)
);

INSERT INTO Customers
VALUES (0,'10001','Pablo Picasso','+34 636 17 63 82','-','Paseo de la Chopera, 14','Madrid','Madrid','Spain','28045');
INSERT INTO Customers
VALUES (1,'20001','Abraham Lincoln','+1 305 907 7086','-','120 SW 8th St','Miami','Florida','United States','33130');
INSERT INTO Customers
VALUES (2,'30001','Napoléon Bonaparte','+33 1 79 75 40 00','-','40 Rue du Colisée','Paris','Île-de-France','France','75008');

CREATE TABLE Invoices (
  ID int,
  "Invoice Number" varchar,
  "Date" date,
  Car int,
  Customer int,
  "Sales Person" int,
);

INSERT INTO Invoices (ID, "Invoice Number", "Date", Car, Customer, "Sales Person")
VALUES (0, '852399038', '20180822', 0, 1, 3)
,(1, '731166526', '20181231', 3, 0, 5)
,(2, '271135104', '20190122', 2, 2, 7);

UPDATE SalesPersons SET Store = 'Miami' WHERE ID = 4;

UPDATE Customers SET Email = 'ppicaso@gmail.com' WHERE Name = 'Pablo Picasso';
UPDATE Customers SET Email = 'lincoln@us.gob' WHERE Name = 'Abraham Lincoln';
UPDATE Customers SET Email = 'hello@napoleon.me' WHERE Name = 'Napoléon Bonaparte';

DELETE FROM Cars WHERE ID = 4;
