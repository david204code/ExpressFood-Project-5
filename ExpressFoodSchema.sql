DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS DailyMenu;
DROP TABLE IF EXISTS Clients;
DROP TABLE IF EXISTS Delivers;
DROP TABLE IF EXISTS AllMenu;

SHOW TABLES;

CREATE TABLE Clients (
  clientId INT PRIMARY KEY AUTO_INCREMENT,
  firstName VARCHAR(50) NOT NULL,
  lastName VARCHAR(50) NOT NULL,
  email VARCHAR(50),
  phone VARCHAR(20) NOT NULL
);

DESCRIBE Clients;

CREATE TABLE Delivers (
  deliverId INT PRIMARY KEY AUTO_INCREMENT,
  firstName VARCHAR(20),
  lastName VARCHAR(20),
  phone VARCHAR(20)
);

DESCRIBE Delivers;

CREATE TABLE AllMenu (
    itemId INT PRIMARY KEY AUTO_INCREMENT,
    type ENUM('Main', 'Dessert'),
    name VARCHAR(100),
    description VARCHAR(100),
    price FLOAT(4,2)
);

DESCRIBE AllMenu;

CREATE TABLE DailyMenu (
    dailyMenuId INT PRIMARY KEY AUTO_INCREMENT,
    itemId INT,
    FOREIGN KEY (itemId) REFERENCES AllMenu(itemId)
);

DESCRIBE DailyMenu;

CREATE TABLE OrderItems (
    orderItemId INT PRIMARY KEY AUTO_INCREMENT,
    clientId INT,
    itemId INT,
    quantity INT,
    FOREIGN KEY (itemId) REFERENCES DailyMenu(itemId),
    FOREIGN KEY (clientId) REFERENCES Clients(clientId)
);

DESCRIBE OrderItems;

CREATE TABLE Orders (
  ordersId INT PRIMARY KEY AUTO_INCREMENT,
  clientId INT,
  deliverId INT,
  orderItemId INT,
  orderPrice FLOAT(4,2),
  status ENUM('delievered', 'cancelled'),
  date DATE,
  paymentMethod ENUM('cash', 'paypal', 'credit_card'),
  address VARCHAR(50),
  city VARCHAR(50),
  state VARCHAR(40),
  country VARCHAR(40),
  postCode VARCHAR(8),
  FOREIGN KEY (clientId) REFERENCES Clients(clientId),
  FOREIGN KEY (deliverId) REFERENCES  Delivers(deliverId),
  FOREIGN KEY (orderItemId) REFERENCES  OrderItems(orderItemId)
);

DESCRIBE Orders;


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
INSERT INTO Menu VALUES(NULL, 'Main', 'Sushi Box Set A', 'Tiger Rolls, Philadephia Rolls, Sake(salmon)', '8.00');
INSERT INTO Menu VALUES(NULL, 'Main', 'Sushi Box Set B', 'Sashimis, Rainbow Rolls, Sake(salmon)', '8.00');
INSERT INTO Menu VALUES(NULL, 'Main', 'Sushi Box Set C', 'Spicy Tuna Rolls, Tiger Rolls, Ebi', '8.00');
INSERT INTO Menu Values(NULL, 'Main', 'Sushi Box Set D', 'Dynamite Rolls, Dragon Rolls, Ahi', '8.00');
INSERT INTO Menu VALUES(NULL, 'Main', 'Fresh Pasta Salad', 'Pasta, Tomatos, Cucumber, Cheese, Sweet Corn', '7.00');
INSERT INTO Menu VALUES(NULL, 'Main', 'Chicken Salad', 'Cooked Chicken, Onions, Sweet Corn, Carrots', '6.00');
INSERT INTO Menu VALUES(NULL, 'Main', 'Potato Salad', 'Onion, Celery, Egg, Potato', '5.00');
INSERT INTO Menu VALUES(NULL, 'Main', 'Tuna Sandwich', 'Tuna, Whole Wheat Bread, Mayo, Sweet Corn', '5.00');
INSERT INTO Menu VALUES(NULL, 'Main', 'Avocado Tuna Salad',	'Tuna, Avocado, Lettuce, Onions', '6.00');
INSERT INTO Menu VALUES(NULL, 'Main', 'Egg Mayo Sandwich', 'Whole Wheat Bread, Egg, Mayo', '5.00');
INSERT INTO Menu(itemId, type, name, price) VALUES(NULL, 'Dessert', 'Chocolate Pudding', '2.50');
INSERT INTO Menu(itemId, type, name, price) VALUES(NULL, 'Dessert', 'Stawberry Cheesecake', '2.50');
INSERT INTO Menu(itemId, type, name, price) VALUES(NULL, 'Dessert', 'Rasberry Pudding', '2.50');
INSERT INTO Menu(itemId, type, name, price) VALUES(NULL, 'Dessert', 'Chocolate Cake', '2.50');
INSERT INTO Menu(itemId, type, name, price) VALUES(NULL, 'Dessert', 'Chocolate Muffins', '2.50');
INSERT INTO Menu(itemId, type, name, price) VALUES(NULL, 'Dessert', 'Chocolate Chip Cookie', '2.50');

SELECT * FROM Menu;

-- Correct query result
INSERT INTO Orders VALUES(NULL, '1', '1', '16.00', 'delievered', '2019-01-05', 'paypal', '101 College Hill', 'London', 'New England', 'United Kingdom', 'SW13 5YP');
INSERT INTO OrderItems VALUES(NULL, '1', '1', '2');
INSERT INTO Orders VALUES(NULL, '1', '1', '7.50', 'delievered', '2019-01-05', 'paypal', '101 College Hill', 'London', 'New England', 'United Kingdom', 'SW13 5YP');
INSERT INTO OrderItems VALUES(NULL, '2', '11', '3');

INSERT INTO Orders VALUES(NULL, '2', '2', '8.00', 'delievered', '2019-01-05', 'cash', '94 Hilltop Road', 'London', 'New England', 'United Kingdom', 'SW12 7EA');
INSERT INTO OrderItems VALUES(NULL, '3', '2', '1');
INSERT INTO Orders VALUES(NULL, '2', '2', '2.50', 'delievered', '2019-01-05', 'cash', '94 Hilltop Road', 'London', 'New England', 'United Kingdom', 'SW12 7EA');
INSERT INTO OrderItems VALUES(NULL, '4', '12', '1');

INSERT INTO Orders VALUES(NULL, '3', '3', '16.00', 'cancelled', '2019-01-05', 'credit_card', '18 Newbury Drive', 'London', 'New England', 'United Kingdom', 'SW16 9PO');
INSERT INTO OrderItems VALUES(NULL, '5', '1', '2');
INSERT INTO Orders VALUES(NULL, '3', '3', '2.50', 'cancelled', '2019-01-05', 'credit_card', '18 Newbury Drive', 'London', 'New England', 'United Kingdom', 'SW16 9PO');
INSERT INTO OrderItems VALUES(NULL, '6', '12', '1');

INSERT INTO Orders VALUES(NULL, '4', '3', '24.00', 'delievered', '2019-01-07', 'credit_card', '1246 Riverside Road', 'London', 'New England', 'United Kingdom', 'N12 3EL');
INSERT INTO OrderItems VALUES(NULL, '7', '3', '4');
INSERT INTO Orders VALUES(NULL, '4', '3', '15.00', 'delievered', '2019-01-07', 'credit_card', '1246 Riverside Road', 'London', 'New England', 'United Kingdom', 'N12 3EL');
INSERT INTO OrderItems VALUES(NULL, '8', '14', '6');

INSERT INTO Orders VALUES(NULL, '5', '2', '8.00', 'delievered', '2019-01-07', 'paypal', '201 Weston Place', 'London', 'New England', 'United Kingdom', 'EA59 3NB');
INSERT INTO OrderItems VALUES(NULL, '9', '4', '1');
INSERT INTO Orders VALUES(NULL, '5', '2', '5.00', 'delievered', '2019-01-07', 'paypal', '201 Weston Place', 'London', 'New England', 'United Kingdom', 'EA59 3NB');
INSERT INTO OrderItems VALUES(NULL, '10', '13', '2');

INSERT INTO Orders VALUES(NULL, '6', '1', '28.00', 'delievered', '2019-01-08', 'paypal', '78 Foxborough', 'London', 'New England', 'United Kingdom', 'EA6 9UN');
INSERT INTO OrderItems VALUES(NULL, '11', '5', '4');
INSERT INTO Orders VALUES(NULL, '6', '1', '5.00', 'delievered', '2019-01-08', 'paypal', '78 Foxborough', 'London', 'New England', 'United Kingdom', 'EA6 9UN');
INSERT INTO OrderItems VALUES(NULL, '12', '15', '4');

INSERT INTO Orders VALUES(NULL, '7', '1', '6.00', 'delievered', '2019-01-08', 'cash', '90 Mansion Palace',	'London', 'New England', 'United Kingdom', 'NM9 7SC');
INSERT INTO OrderItems VALUES(NULL, '13', '6', '1');
INSERT INTO Orders VALUES(NULL, '7', '1', '5.00', 'delievered', '2019-01-08', 'cash', '90 Mansion Palace',	'London', 'New England', 'United Kingdom', 'NM9 7SC');
INSERT INTO OrderItems VALUES(NULL, '14', '16', '2');

INSERT INTO Orders VALUES(NULL, '8', '3', '5.00', 'delievered', '2019-01-10', 'paypal', '19 Old Street', 'London', 'New England', 'United Kingdom', 'LN2 5UN');
INSERT INTO OrderItems VALUES(NULL, '15', '7', '1');
INSERT INTO Orders VALUES(NULL, '8', '3', '5.00', 'delievered', '2019-01-10', 'paypal', '19 Old Street', 'London', 'New England', 'United Kingdom', 'LN2 5UN');
INSERT INTO OrderItems VALUES(NULL, '16', '14', '2');

INSERT INTO Orders VALUES(NULL, '9', '2', '20.00', 'delievered', '2019-01-10', 'credit_card', '93 Stranford Road', 'Manchester', 'New England', 'United Kingdom', 'MC7 9CV');
INSERT INTO OrderItems VALUES(NULL, '17', '8', '4');
INSERT INTO Orders VALUES(NULL, '9', '2', '5.00', 'delievered', '2019-01-10', 'credit_card', '93 Stranford Road', 'Manchester', 'New England', 'United Kingdom', 'MC7 9CV');
INSERT INTO OrderItems VALUES(NULL, '18', '16', '2');

INSERT INTO Orders VALUES(NULL, '10', '2', '20.00', 'cancelled', '2019-01-11', 'cash', '1 Anfield', 'Liverpool', 'New England', 'United Kingdom', 'LC1 4PB');
INSERT INTO OrderItems VALUES(NULL, '19', '10', '4');

INSERT INTO Orders VALUES(NULL, '5', '2', '12.00', 'delievered', '2019-01-11', 'credit_card', '201 Weston Place', 'London', 'New England', 'United Kingdom', 'EA59 3NB');
INSERT INTO OrderItems VALUES(NULL, '20', '9', '2');
INSERT INTO Orders VALUES(NULL, '5', '2', '5.00', 'delievered', '2019-01-11', 'credit_card', '201 Weston Place', 'London', 'New England', 'United Kingdom', 'EA59 3NB');
INSERT INTO OrderItems VALUES(NULL, '21', '12', '2'); 

-- List of Clients
SELECT * FROM Clients;

-- Daily menu
SELECT * FROM Menu;

-- List of Delievery people
SELECT * FROM Delivers;

-- order history for each client
SELECT OrderItems.orderId, Orders.date, Clients.firstName, Clients.lastName, Orders.orderPrice
FROM OrderItems 
JOIN Menu USING(itemId)
JOIN Orders USING(orderId)
JOIN Clients 
ON Orders.clientId = Clients.clientId
WHERE Clients.clientId = 5;

