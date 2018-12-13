
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

-- DESCRIBE Clients;

CREATE TABLE Addresses (
  addressId INT PRIMARY KEY AUTO_INCREMENT,
  address VARCHAR(40),
  city VARCHAR(15),
  state VARCHAR(10),
  country VARCHAR(15),
  postCode VARCHAR(8),
  clientId INT,
  FOREIGN KEY (clientId) REFERENCES Clients(clientId)
);

-- DESCRIBE Addresses;

CREATE TABLE Delivers (
  deliverId INT PRIMARY KEY AUTO_INCREMENT,
  firstName VARCHAR(20),
  lastName VARCHAR(20),
  phone VARCHAR(20)
);

-- DESCRIBE Delivers;

CREATE TABLE Orders (
  orderId INT PRIMARY KEY AUTO_INCREMENT,
  clientId INT,
  deliverId INT,
  totalPrice FLOAT(4,2),
  status ENUM('pending', 'processing', 'delievered', 'cancelled'),
  date DATETIME,
  paymentMethod ENUM('cash', 'paypal', 'credit_card'),
  address VARCHAR(40),
  city VARCHAR(15),
  state VARCHAR(10),
  country VARCHAR(15),
  postCode VARCHAR(8),
  FOREIGN KEY (clientId) REFERENCES Clients(clientId),
  FOREIGN KEY (deliverId) REFERENCES Delivers(deliverId)
);

-- DESCRIBE Orders;

CREATE TABLE Menu (
    itemId INT PRIMARY KEY AUTO_INCREMENT,
    type ENUM('main', 'dessert'),
    name VARCHAR(10),
    description VARCHAR(100),
    price FLOAT(4,2),
    active TINYINT(1)
);

-- DESCRIBE Menu;

CREATE TABLE OrderItems (
    orderItemId INT PRIMARY KEY AUTO_INCREMENT,
    orderId INT,
    itemId INT,
    quantity INT,
    FOREIGN KEY (orderId) REFERENCES Orders(orderId),
    FOREIGN KEY (itemId) REFERENCES Menu(itemId)
);

  -- DESCRIBE OrderItems;

-- INSERT CLIENTS
INSERT INTO Clients
INSERT INTO Clients
INSERT INTO Clients
INSERT INTO Clients

-- INSERT ADDRESSES
INSERT INTO Addresses;