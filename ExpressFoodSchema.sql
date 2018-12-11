

CREATE TABLE Clients (
  clientId INT PRIMARY KEY AUTO_INCREMENT,
  firstName VARCHAR(20) NOT NULL,
  lastName VARCHAR(20) NOT NULL,
  email VARCHAR(50),
  phone VARCHAR(20)
);

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

CREATE TABLE Orders (
  orderId INT PRIMARY KEY AUTO_INCREMENT,
  clientId INT,
  driverId INT,
  totalPrice FLOAT(4,2),
  status ENUM('Preparing', 'Cooking', 'Cancel', 'Delievery'),
  date DATETIME,
  paymentMethod ENUM('Cash', 'Paypal', 'Credit Card'),
  address VARCHAR(40),
  city VARCHAR(15),
  state VARCHAR(10),
  country VARCHAR(15),
  postCode VARCHAR(8),
  FOREIGN KEY (clientId) REFERENCES Clients(clientId)
);

ALTER TABLE Orders
ADD FOREIGN KEY(driverId)
REFERENCES Delievers(driverId)
ON DELETE SET NULL;

CREATE TABLE Delievers (
  driverId INT PRIMARY KEY AUTO_INCREMENT,
  firstName VARCHAR(20),
  lastName VARCHAR(20),
  phone VARCHAR(20)
);

CREATE TABLE OrderItems (
  orderItemId INT PRIMARY KEY AUTO_INCREMENT,
  orderId INT,
  itemId INT, 
  quantity INT,
  FOREIGN KEY (orderId) REFERENCES Orders(orderId) 
);

ALTER TABLE OrderItems
ADD FOREIGN KEY (itemId) REFERENCES Menu(itemId)

CREATE TABLE Menu (
  itemId INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(10),
  description VARCHAR(100),
  price FLOAT(4,2),
  active TINYINT(1)
);
