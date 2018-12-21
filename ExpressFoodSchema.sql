
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
    type ENUM('main', 'dessert'),
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
INSERT INTO Clients
INSERT INTO Clients
INSERT INTO Clients
INSERT INTO Clients

-- INSERT ADDRESSES
INSERT INTO Addresses;


INSERT INTO Clients VALUES(NULL, 'David', 'Beckham', 'becksdavid7@gmail.com', '9086897258');
INSERT INTO Clients VALUES(NULL, 'Lionel', 'Messi', 'messi10@gmail.com', '9973833810');
INSERT INTO Clients VALUES(NULL, 'David', 'Luiz', 'davidluiz@gmail.com', '9698713028');


SELECT * FROM Clients;

INSERT INTO Addresses VALUES(NULL, '101 College hill', 'London', 'New England', 'United Kingdom', 'SW13 5YP', '1');

SELECT * FROM Addresses;

INSERT INTO Delivers VALUES(NULL, 'Jack', 'Bauer', '9853983399');

SELECT * FROM Delivers;

INSERT INTO Menu VALUES(NULL, 'Sushi box set a', 'Tiger rolls, Philadephia rolls, Sake(salmon)', '8.00', '1');

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