
DROP TABLE IF EXISTS Addresses;
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Clients;
DROP TABLE IF EXISTS Delivers;
DROP TABLE IF EXISTS Menu;


CREATE TABLE Clients (
  clientId INT PRIMARY KEY AUTO_INCREMENT,
  firstName VARCHAR(20) NOT NULL,
  lastName VARCHAR(20) NOT NULL,
  email VARCHAR(50),
  phone VARCHAR(20) NOT NULL
);

DESCRIBE Clients;

CREATE TABLE Addresses (
  addressId INT PRIMARY KEY AUTO_INCREMENT,
  address VARCHAR(50),
  city VARCHAR(30),
  state VARCHAR(50),
  country VARCHAR(50),
  postCode VARCHAR(8),
  clientId INT,
  FOREIGN KEY (clientId) REFERENCES Clients(clientId)
);

DESCRIBE Addresses;

CREATE TABLE Delivers (
  deliverId INT PRIMARY KEY AUTO_INCREMENT,
  firstName VARCHAR(20),
  lastName VARCHAR(20),
  phone VARCHAR(20)
);

DESCRIBE Delivers;

CREATE TABLE Orders (
  orderId INT PRIMARY KEY AUTO_INCREMENT,
  clientId INT,
  deliverId INT,
  totalPrice FLOAT(4,2),
  status ENUM('pending', 'processing', 'delievered', 'cancelled'),
  date DATETIME DEFAULT CURRENT_TIMESTAMP,
  paymentMethod ENUM('cash', 'paypal', 'credit_card'),
  address VARCHAR(50),
  city VARCHAR(30),
  state VARCHAR(50),
  country VARCHAR(50),
  postCode VARCHAR(8),
  FOREIGN KEY (clientId) REFERENCES Clients(clientId),
  FOREIGN KEY (deliverId) REFERENCES Delivers(deliverId)
);

DESCRIBE Orders;

CREATE TABLE Menu (
    itemId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description VARCHAR(100),
    type ENUM('Main', 'Dessert'),
    price FLOAT(4,2),
    active TINYINT(1)
);

DESCRIBE Menu;

CREATE TABLE OrderItems (
    orderItemId INT PRIMARY KEY AUTO_INCREMENT,
    orderId INT,
    itemId INT,
    quantity INT,
    FOREIGN KEY (orderId) REFERENCES Orders(orderId),
    FOREIGN KEY (itemId) REFERENCES Menu(itemId)
);

DESCRIBE OrderItems;

-- INSERT CLIENTS
INSERT INTO Clients VALUES(NULL, 'David', 'Beckham', 'becksdavid7@gmail.com', '9086897258');
INSERT INTO Clients VALUES(NULL, 'Lionel', 'Messi', 'messi10@gmail.com', '9973833810');
INSERT INTO Clients VALUES(NULL, 'David', 'Luiz', 'davidluiz@gmail.com', '9698713028');
INSERT INTO Clients VALUES(NULL, 'Jose', 'Mourinho', 'specialone@hotmail.com', '9823912069');
INSERT INTO Clients VALUES(NULL, 'Cristiano', 'Ronaldo', 'cr7ronaldo@gmail.com', '9863021687');
INSERT INTO Clients VALUES(NULL, 'Toni', 'Kross', 'krossworldcup@hotmail.com', '9678930263');
INSERT INTO Clients VALUES(NULL, 'Luka', 'Modric', 'lukagolden@hotmail.com', '9513694713');
INSERT INTO Clients VALUES(NULL, 'Aaron', 'Ramsey', 'rambo@hotmail.com', '9987133972');
INSERT INTO Clients VALUES(NULL, 'Alexis', 'Sanchez', 'alexis7@gmail.com', '9971391339');
INSERT INTO Clients VALUES(NULL, 'Michael', 'Owen', 'owenEngland@hotmail.com', '9541486346');

SELECT * FROM Clients;

-- INSERT ADDRESSES
INSERT INTO Addresses VALUES(NULL, '101 College Hill', 'London', 'New England', 'United Kingdom', 'SW13 5YP', '1');
INSERT INTO Addresses VALUES(NULL, '94 Hilltop Road', 'London', 'New England', 'United Kingdom', 'SW12 7EA', '2');
INSERT INTO Addresses VALUES(NULL, '18 Newbury Drive', 'London', 'New England', 'United Kingdom', 'SW16 9PO', '3');
INSERT INTO Addresses VALUES(NULL, '1246 Riverside Road', 'London', 'New England', 'United Kingdom', 'N12 3EL', '4');
INSERT INTO Addresses VALUES(NULL, '201 Weston Place', 'London', 'New England', 'United Kingdom', 'EA59 3NB', '5');
INSERT INTO Addresses VALUES(NULL, '78 Foxborough', 'London', 'New England', 'United Kingdom', 'EA6 9UN', '6');
INSERT INTO Addresses VALUES(NULL, '90 Mansion Palace',	'London', 'New England', 'United Kingdom', 'NM9 7SC', '7');
INSERT INTO Addresses VALUES(NULL, '19 Old Street', 'London', 'New England', 'United Kingdom', 'LN2 5UN', '8');
INSERT INTO Addresses VALUES(NULL, '93 Stranford Road', 'Manchester', 'New England', 'United Kingdom', 'MC7 9CV', '9');
INSERT INTO Addresses VALUES(NULL, '1 Anfield', 'Liverpool', 'New England', 'United Kingdom', 'LC1 4PB', '10');

SELECT * FROM Addresses;

-- INSERT Delievers
INSERT INTO Delivers VALUES(NULL, 'Jack', 'Bauer', '9853983399');
INSERT INTO Delivers VALUES(NULL, 'Joe', 'Martial', '9865236916');
INSERT INTO Delivers VALUES(NULL, 'Marvel', 'Jones', '9652149635');

SELECT * FROM Delivers;

-- INSERT Menu


SELECT * FROM Menu;



INSERT INTO Orders VALUES(NULL, '1', '1', '0.00', 'pending', NULL, 'paypal', '101 College hill', 'London', 'New England', 'United Kingdom', 'SW13 5YP');

SELECT * FROM Orders;

INSERT INTO OrderItems VALUES(NULL, '1', '1', '2');

SELECT * FROM OrderItems;


SELECT 
    o.orderId, o.totalPrice, 
    CONCAT(c.firstName, ' ', c.lastName) AS Client,
    CONCAT(d.firstName, ' ', d.lastName) AS Deliver
FROM Orders o
JOIN Clients c USING(clientId)
JOIN Delivers d USING(deliverId)
WHERE o.clientId = 1
;