DROP DATABASE IF EXISTS `bakery`;
CREATE DATABASE `bakery`;
USE `bakery`;

CREATE TABLE `Customer` ( 
`custid`	INTEGER AUTO_INCREMENT, 
`custname`	varchar(30) NOT NULL, 
`ccn`	varchar(20) NOT NULL,
`cphoneno`	varchar(12)  NOT NULL, 
`address`	varchar(60)  NOT NULL, 
`city`	varchar(20)  NOT NULL, 
`zip`	varchar(10) NOT NULL, 
PRIMARY KEY	 (`custid`)
); 


CREATE TABLE `Cake` ( 
`cakeid`	INTEGER AUTO_INCREMENT, 
`cakename`	varchar(30) NOT NULL,
`slices`	INTEGER NOT NULL,
`status`	varchar(15) NOT NULL,
`price`	float NOT NULL,
PRIMARY KEY	 (`cakeid`)
); 

CREATE TABLE `Ingredient` (
`ingredid`	INTEGER AUTO_INCREMENT,
`iname`	varchar(20) NOT NULL,
`price`	float NOT NULL,
`available`	float NOT NULL,
PRIMARY KEY(`ingredid`)
);

CREATE TABLE `Contain` ( 
`cakeid`	INTEGER,
`ingredid`	INTEGER, 
`qty`	FLOAT NOT NULL,
PRIMARY KEY	 (`cakeid`, `ingredid`),
FOREIGN KEY (`ingredid`) REFERENCES Ingredient (`ingredid`),
FOREIGN KEY (`cakeid`) REFERENCES Cake (`cakeid`)
);

CREATE TABLE `Orders` (
`custid`	INTEGER, 
`cakeid`	INTEGER,
`ordertime`	DATETIME, 
`pickuptime`	DATETIME,
`pricepaid`	float NOT NULL,
PRIMARY KEY	 (`custid`, `cakeid`, `ordertime`),
FOREIGN KEY (`custid`) REFERENCES Customer (`custid`),
FOREIGN KEY (`cakeid`) REFERENCES Cake (`cakeid`)
);  




INSERT INTO Customer values(1,"Ryan","3456 7898 7654 3456","345-654-2345","31, Atlantic Avenue","New York","11305");
INSERT INTO Customer values(2,"Brooklyn","6545 6789 7654 2314","986-943-6789","25 Lincoln Road","New York","11309");
INSERT INTO Customer values(3,"Romeo","9876 6789 5467 8734","437-875-7896","1176 Gramercy Avenue ","New York","11304");
INSERT INTO Customer values(4,"Cruz","8761 3428 9642 7854","348-945-0950","096 Pawling Parkway","New York","11301");
INSERT INTO Customer values(5,"David","5434 5678 9834 2347","126-953-3960","0863 Farmco Road","New York","11305");
INSERT INTO Customer values(6,"Victoria","8709 0985 1280","459-940-3030","81674 Westerfield Circle","New York","11305");
INSERT INTO Customer values(7,"Hannah","1129 8767 4509 6429","167-876-7546","34267 Glendale Parkway","New York","11304");



INSERT INTO Cake values(1,"Chocolate Truffle",5,"Available", 42.00);
INSERT INTO Cake values(2,"Cheesecake",4,"Available", 55.00);
INSERT INTO Cake values(3,"Lemoncake",7,"Available", 49.00);
INSERT INTO Cake values(4,"Red Velvet",4,"Discontinued", 42.00);
INSERT INTO Cake values(5,"Fruitcake",10,"Available", 70.00);
INSERT INTO Cake values(6,"coffeecake",5,"Available", 50.00);
INSERT INTO Cake values(7,"Pumpkin Spice",2,"Available", 12.00);

INSERT INTO Ingredient values(1,"flour",22.00,50.50);
INSERT INTO Ingredient values(2,"sugar",5.00,10.50);
INSERT INTO Ingredient values(3,"lime",10.00,5.00);
INSERT INTO Ingredient values(4,"cocoa",20.00,25.50);
INSERT INTO Ingredient values(5,"pumpkin",12.00,2.00);
INSERT INTO Ingredient values(6,"eggs",25.00,50.00);
INSERT INTO Ingredient values(7,"coffee",40.00,5.00);
INSERT INTO Ingredient values(8,"cheese",10.00,100.00);



INSERT INTO Contain values(1,1,2.50);
INSERT INTO Contain values(1,2,0.20);
INSERT INTO Contain values(1,4,1.50);
INSERT INTO Contain values(1,6,3.00);

INSERT INTO Contain values(2,1,2.50);
INSERT INTO Contain values(2,2,0.20);
INSERT INTO Contain values(2,8,2.00);

INSERT INTO Contain values(3,1,2.50);
INSERT INTO Contain values(3,2,0.20);
INSERT INTO Contain values(3,3,1.00);

INSERT INTO Contain values(4,1,2.50);
INSERT INTO Contain values(4,2,0.20);
INSERT INTO Contain values(4,6,3.00);

INSERT INTO Contain values(5,1,2.50);
INSERT INTO Contain values(5,2,0.20);
INSERT INTO Contain values(5,6,3.00);

INSERT INTO Contain values(6,1,2.50);
INSERT INTO Contain values(6,2,0.20);
INSERT INTO Contain values(6,6,2.00);
INSERT INTO Contain values(6,7,1.50);
INSERT INTO Contain values(6,4,1.50);

INSERT INTO Contain values(7,1,2.50);
INSERT INTO Contain values(7,2,0.20);
INSERT INTO Contain values(7,5,1.00);
INSERT INTO Contain values(7,6,2.00);



INSERT INTO Orders values(1,1,"2020-05-19 12:30:00","2020-05-19 18:30:00",40.00);
INSERT INTO Orders values(1,1,"2021-05-19 12:30:00","2021-05-19 18:30:00",42.00);
INSERT INTO Orders values(6,1,"2021-12-24 10:30:00","2021-12-25 21:30:00",45.00);
INSERT INTO Orders values(3,1,"2021-08-01 08:00:00","2021-08-03 14:30:00",40.00);
INSERT INTO Orders values(2,2,"2020-07-19 12:30:00","2020-07-19 18:30:00",60.00);
INSERT INTO Orders values(7,2,"2021-03-21 12:30:00","2021-03-21 20:30:00",52.00);
INSERT INTO Orders values(6,2,"2021-12-03 10:30:00","2021-12-04 21:30:00",55.00);
INSERT INTO Orders values(4,2,"2021-08-10 18:00:00","2021-08-11 19:30:00",50.00);
INSERT INTO Orders values(2,3,"2020-07-01 12:30:00","2020-07-02 18:30:00",50.00);
INSERT INTO Orders values(7,3,"2021-09-21 12:30:00","2021-09-21 20:30:00",52.00);
INSERT INTO Orders values(1,3,"2021-12-03 10:30:00","2021-12-04 21:30:00",55.00);
INSERT INTO Orders values(4,3,"2021-09-10 18:00:00","2021-09-11 19:30:00",50.00);
INSERT INTO Orders values(3,7,"2020-07-30 12:30:00","2020-08-01 18:30:00",60.00);
INSERT INTO Orders values(4,7,"2021-06-21 12:30:00","2021-06-21 20:30:00",52.00);
INSERT INTO Orders values(2,7,"2021-03-03 10:30:00","2021-03-04 21:30:00",55.00);
INSERT INTO Orders values(4,7,"2021-12-10 18:00:00","2021-12-11 19:30:00",50.00);
