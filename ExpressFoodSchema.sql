DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS OrderItem;
DROP TABLE IF EXISTS DailyMenu;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS Driver;
DROP TABLE IF EXISTS AllMenu;

SHOW TABLES;

CREATE TABLE Client (
  clientId INT PRIMARY KEY AUTO_INCREMENT,
  firstName VARCHAR(50) NOT NULL,
  lastName VARCHAR(50) NOT NULL,
  email VARCHAR(50),
  phone VARCHAR(20) NOT NULL
);

-- DESCRIBE Client;

CREATE TABLE Driver (
  driverId INT PRIMARY KEY AUTO_INCREMENT,
  firstName VARCHAR(20),
  lastName VARCHAR(20),
  phone VARCHAR(20)
);

-- DESCRIBE Driver;

CREATE TABLE AllMenu (
    itemId INT PRIMARY KEY AUTO_INCREMENT,
    type ENUM('Main', 'Dessert'),
    name VARCHAR(100),
    description VARCHAR(100),
    price FLOAT(4,2)
);

-- DESCRIBE AllMenu;

CREATE TABLE DailyMenu (
    dailyMenuId INT PRIMARY KEY AUTO_INCREMENT,
    itemId INT,
    day ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'),
    FOREIGN KEY (itemId) REFERENCES AllMenu(itemId)
);

-- DESCRIBE DailyMenu;

CREATE TABLE OrderItem (
    orderItemId INT PRIMARY KEY AUTO_INCREMENT,
    clientId INT,
    itemId INT,
    quantity INT,
    FOREIGN KEY (itemId) REFERENCES DailyMenu(itemId),
    FOREIGN KEY (clientId) REFERENCES Client(clientId)
);

-- DESCRIBE OrderItem;

CREATE TABLE Orders (
  ordersId INT PRIMARY KEY AUTO_INCREMENT,
  clientId INT,
  driverId INT,
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
  FOREIGN KEY (clientId) REFERENCES Client(clientId),
  FOREIGN KEY (driverId) REFERENCES  Driver(driverId),
  FOREIGN KEY (orderItemId) REFERENCES  OrderItem(orderItemId)
);

-- DESCRIBE Orders;

-- INSERT CLIENT
INSERT INTO Client VALUES(NULL, 'David', 'Beckham', 'becksdavid7@gmail.com', '9086897258');
INSERT INTO Client VALUES(NULL, 'Lionel', 'Messi', 'messi10@gmail.com', '9973833810');
INSERT INTO Client VALUES(NULL, 'David', 'Luiz', 'davidluiz@gmail.com', '9698713028');
INSERT INTO Client VALUES(NULL, 'Jose', 'Mourinho', 'specialone@hotmail.com', '9823912069');
INSERT INTO Client VALUES(NULL, 'Cristiano', 'Ronaldo', 'cr7ronaldo@gmail.com', '9863021687');
INSERT INTO Client VALUES(NULL, 'Toni', 'Kross', 'krossworldcup@hotmail.com', '9678930263');
INSERT INTO Client VALUES(NULL, 'Luka', 'Modric', 'lukagolden@hotmail.com', '9513694713');
INSERT INTO Client VALUES(NULL, 'Aaron', 'Ramsey', 'rambo@hotmail.com', '9987133972');
INSERT INTO Client VALUES(NULL, 'Alexis', 'Sanchez', 'alexis7@gmail.com', '9971391339');
INSERT INTO Client VALUES(NULL, 'Michael', 'Owen', 'owenEngland@hotmail.com', '9541486346');

SELECT * FROM Client;

-- INSERT Driver
INSERT INTO Driver VALUES(NULL, 'Jack', 'Bauer', '9853983399');
INSERT INTO Driver VALUES(NULL, 'Joe', 'Martial', '9865236916');
INSERT INTO Driver VALUES(NULL, 'Marvel', 'Jones', '9652149635');

SELECT * FROM Driver;

-- INSERT AllMenu
INSERT INTO AllMenu VALUES(NULL, 'Main', 'Sushi Box Set A', 'Tiger Rolls, Philadephia Rolls, Sake(salmon)', '8.00');
INSERT INTO AllMenu VALUES(NULL, 'Main', 'Sushi Box Set B', 'Sashimis, Rainbow Rolls, Sake(salmon)', '8.00');
INSERT INTO AllMenu VALUES(NULL, 'Main', 'Sushi Box Set C', 'Spicy Tuna Rolls, Tiger Rolls, Ebi', '8.00');
INSERT INTO AllMenu VALUES(NULL, 'Main', 'Fresh Pasta Salad', 'Pasta, Tomatos, Cucumber, Cheese, Sweet Corn', '7.00');
INSERT INTO AllMenu VALUES(NULL, 'Main', 'Chicken Salad', 'Cooked Chicken, Onions, Sweet Corn, Carrots', '6.00');
INSERT INTO AllMenu VALUES(NULL, 'Main', 'Potato Salad', 'Onion, Celery, Egg, Potato', '5.00');
INSERT INTO AllMenu VALUES(NULL, 'Main', 'Tuna Sandwich', 'Tuna, Whole Wheat Bread, Mayo, Sweet Corn', '5.00');
INSERT INTO AllMenu VALUES(NULL, 'Main', 'Avocado Tuna Salad',	'Tuna, Avocado, Lettuce, Onions', '6.00');
INSERT INTO AllMenu VALUES(NULL, 'Main', 'Egg Mayo Sandwich', 'Whole Wheat Bread, Egg, Mayo', '5.00');
INSERT INTO AllMenu(itemId, type, name, price) VALUES(NULL, 'Dessert', 'Chocolate Pudding', '2.50');
INSERT INTO AllMenu(itemId, type, name, price) VALUES(NULL, 'Dessert', 'Stawberry Cheesecake', '2.50');
INSERT INTO AllMenu(itemId, type, name, price) VALUES(NULL, 'Dessert', 'Rasberry Pudding', '2.50');
INSERT INTO AllMenu(itemId, type, name, price) VALUES(NULL, 'Dessert', 'Chocolate Cake', '2.50');
INSERT INTO AllMenu(itemId, type, name, price) VALUES(NULL, 'Dessert', 'Chocolate Muffins', '2.50');
INSERT INTO AllMenu(itemId, type, name, price) VALUES(NULL, 'Dessert', 'Chocolate Chip Cookie', '2.50');

SELECT * FROM AllMenu;

-- INSERT DailyMenu
INSERT INTO DailyMenu VALUES(NULL, '1', 'Monday');
INSERT INTO DailyMenu VALUES(NULL, '2', 'Monday');
INSERT INTO DailyMenu VALUES(NULL, '10', 'Monday');
INSERT INTO DailyMenu VALUES(NULL, '11', 'Monday');
INSERT INTO DailyMenu VALUES(NULL, '3', 'Tuesday');
INSERT INTO DailyMenu VALUES(NULL, '4', 'Tuesday');
INSERT INTO DailyMenu VALUES(NULL, '12', 'Tuesday');
INSERT INTO DailyMenu VALUES(NULL, '13', 'Tuesday');
INSERT INTO DailyMenu VALUES(NULL, '5', 'Wednesday');
INSERT INTO DailyMenu VALUES(NULL, '6', 'Wednesday');
INSERT INTO DailyMenu VALUES(NULL, '14', 'Wednesday');
INSERT INTO DailyMenu VALUES(NULL, '15', 'Wednesday');
INSERT INTO DailyMenu VALUES(NULL, '7', 'Thursday');
INSERT INTO DailyMenu VALUES(NULL, '8', 'Thursday');
INSERT INTO DailyMenu VALUES(NULL, '15', 'Thursday');
INSERT INTO DailyMenu VALUES(NULL, '14', 'Thursday');
INSERT INTO DailyMenu VALUES(NULL, '1', 'Friday');
INSERT INTO DailyMenu VALUES(NULL, '3', 'Friday');
INSERT INTO DailyMenu VALUES(NULL, '10', 'Friday');
INSERT INTO DailyMenu VALUES(NULL, '12', 'Friday');
INSERT INTO DailyMenu VALUES(NULL, '2', 'Saturday');
INSERT INTO DailyMenu VALUES(NULL, '4', 'Saturday');
INSERT INTO DailyMenu VALUES(NULL, '11', 'Saturday');
INSERT INTO DailyMenu VALUES(NULL, '13', 'Saturday');
INSERT INTO DailyMenu VALUES(NULL, '5', 'Sunday');
INSERT INTO DailyMenu VALUES(NULL, '7', 'Sunday');
INSERT INTO DailyMenu VALUES(NULL, '10', 'Sunday');
INSERT INTO DailyMenu VALUES(NULL, '11', 'Sunday');

SELECT * FROM DailyMenu;

-- Round 2 
-- INSERT OrderItems
INSERT INTO OrderItem VALUES(NULL, '1', '1', '2'); 
INSERT INTO Orders VALUES(NULL, '1', '1', '1', '16.00', 'delievered', '2019-01-07', 'paypal', '101 College Hill', 'London', 'New England', 'United Kingdom', 'SW13 5YP');
INSERT INTO OrderItem VALUES(NULL, '1', '11', '3');
INSERT INTO Orders VALUES(NULL, '1', '1', '2', '7.50', 'delievered', '2019-01-07', 'paypal', '101 College Hill', 'London', 'New England', 'United Kingdom', 'SW13 5YP');

INSERT INTO OrderItem VALUES(NULL, '2', '2', '1');
INSERT INTO Orders VALUES(NULL, '2', '2', '3', '8.00', 'delievered', '2019-01-07', 'cash', '94 Hilltop Road', 'London', 'New England', 'United Kingdom', 'SW12 7EA');
INSERT INTO OrderItem VALUES(NULL, '2', '10', '1');
INSERT INTO Orders VALUES(NULL, '2', '2', '4', '2.50', 'delievered', '2019-01-07', 'cash', '94 Hilltop Road', 'London', 'New England', 'United Kingdom', 'SW12 7EA');

INSERT INTO OrderItem VALUES(NULL, '3', '1', '2');
INSERT INTO Orders VALUES(NULL, '3', '3', '5', '16.00', 'cancelled', '2019-01-07', 'credit_card', '18 Newbury Drive', 'London', 'New England', 'United Kingdom', 'SW16 9PO');
INSERT INTO OrderItem VALUES(NULL, '3', '11', '1');
INSERT INTO Orders VALUES(NULL, '3', '3', '6', '2.50', 'cancelled', '2019-01-07', 'credit_card', '18 Newbury Drive', 'London', 'New England', 'United Kingdom', 'SW16 9PO');

INSERT INTO OrderItem VALUES(NULL, '4', '3', '4');
INSERT INTO Orders VALUES(NULL, '4', '3', '7', '32.00', 'delievered', '2019-01-08', 'credit_card', '1246 Riverside Road', 'London', 'New England', 'United Kingdom', 'N12 3EL');
INSERT INTO OrderItem VALUES(NULL, '4', '12', '6');
INSERT INTO Orders VALUES(NULL, '4', '3', '8', '15.00', 'delievered', '2019-01-08', 'credit_card', '1246 Riverside Road', 'London', 'New England', 'United Kingdom', 'N12 3EL');

INSERT INTO OrderItem VALUES(NULL, '5', '4', '1');
INSERT INTO Orders VALUES(NULL, '5', '2', '9', '8.00', 'delievered', '2019-01-08', 'paypal', '201 Weston Place', 'London', 'New England', 'United Kingdom', 'EA59 3NB');
INSERT INTO OrderItem VALUES(NULL, '5', '13', '2');
INSERT INTO Orders VALUES(NULL, '5', '2', '10', '5.00', 'delievered', '2019-01-08', 'paypal', '201 Weston Place', 'London', 'New England', 'United Kingdom', 'EA59 3NB');

INSERT INTO OrderItem VALUES(NULL, '6', '5', '4');
INSERT INTO Orders VALUES(NULL, '6', '1', '11', '24.00', 'delievered', '2019-01-09', 'paypal', '78 Foxborough', 'London', 'New England', 'United Kingdom', 'EA6 9UN');
INSERT INTO OrderItem VALUES(NULL, '6', '14', '4');
INSERT INTO Orders VALUES(NULL, '6', '1', '12', '10.00', 'delievered', '2019-01-09', 'paypal', '78 Foxborough', 'London', 'New England', 'United Kingdom', 'EA6 9UN');

INSERT INTO OrderItem VALUES(NULL, '7', '6', '1');
INSERT INTO Orders VALUES(NULL, '7', '2','13', '6.00', 'delievered', '2019-01-09', 'cash', '90 Mansion Palace',	'London', 'New England', 'United Kingdom', 'NM9 7SC');
INSERT INTO OrderItem VALUES(NULL, '7', '15', '2');
INSERT INTO Orders VALUES(NULL, '7', '2', '14', '5.00', 'delievered', '2019-01-09', 'cash', '90 Mansion Palace',	'London', 'New England', 'United Kingdom', 'NM9 7SC');

INSERT INTO OrderItem VALUES(NULL, '8', '7', '1');
INSERT INTO Orders VALUES(NULL, '8', '3', '15', '5.00', 'delievered', '2019-01-10', 'paypal', '19 Old Street', 'London', 'New England', 'United Kingdom', 'LN2 5UN');
INSERT INTO OrderItem VALUES(NULL, '8', '15', '2');
INSERT INTO Orders VALUES(NULL, '8', '3', '16', '5.00', 'delievered', '2019-01-10', 'paypal', '19 Old Street', 'London', 'New England', 'United Kingdom', 'LN2 5UN');

INSERT INTO OrderItem VALUES(NULL, '9', '8', '4');
INSERT INTO Orders VALUES(NULL, '9', '2', '17', '24.00', 'delievered', '2019-01-10', 'credit_card', '93 Stranford Road', 'Manchester', 'New England', 'United Kingdom', 'MC7 9CV');
INSERT INTO OrderItem VALUES(NULL, '9', '14', '2');
INSERT INTO Orders VALUES(NULL, '9', '2', '18', '5.00', 'delievered', '2019-01-10', 'credit_card', '93 Stranford Road', 'Manchester', 'New England', 'United Kingdom', 'MC7 9CV');

INSERT INTO OrderItem VALUES(NULL, '10', '10', '8');
INSERT INTO Orders VALUES(NULL, '10', '1', '19', '20.00', 'cancelled', '2019-01-11', 'cash', '1 Anfield', 'Liverpool', 'New England', 'United Kingdom', 'LC1 4PB');
INSERT INTO OrderItem VALUES(NULL, '10', '3', '2');
INSERT INTO Orders VALUES(NULL, '10', '1', '20', '16.00', 'delievered', '2019-01-11', 'cash', '1 Anfield', 'Liverpool', 'New England', 'United Kingdom', 'LC1 4PB');

INSERT INTO OrderItem VALUES(NULL, '5', '2', '2');
INSERT INTO Orders VALUES(NULL, '5', '2', '21', '16.00', 'delievered', '2019-01-12', 'credit_card', '201 Weston Place', 'London', 'New England', 'United Kingdom', 'EA59 3NB');
INSERT INTO OrderItem VALUES(NULL, '5', '13', '2'); 
INSERT INTO Orders VALUES(NULL, '5', '2', '22', '5.00', 'delievered', '2019-01-12', 'credit_card', '201 Weston Place', 'London', 'New England', 'United Kingdom', 'EA59 3NB');

INSERT INTO OrderItem VALUES(NULL, '3', '5', '2');
INSERT INTO Orders VALUES(NULL, '3', '3', '23', '12.00', 'delievered', '2019-01-13', 'credit_card', '18 Newbury Drive', 'London', 'New England', 'United Kingdom', 'SW16 9PO');
INSERT INTO OrderItem VALUES(NULL, '3', '10', '1');
INSERT INTO Orders VALUES(NULL, '3', '3', '24', '2.50', 'delievered', '2019-01-13', 'credit_card', '18 Newbury Drive', 'London', 'New England', 'United Kingdom', 'SW16 9PO');

SELECT * FROM OrderItem;
SELECT * FROM Orders;


-- List of Client
SELECT * FROM Client;

-- Daily menu
SELECT * FROM DailyMenu;
SELECT * FROM AllMenu;

-- List of Driver
SELECT * FROM Driver;

-- order history for each client 
SELECT 
    ordersId, 
    CONCAT(c.firstName, ' ', c.lastName) as Client, 
    CONCAT(d.firstName, ' ', d.lastName) as Driver, 
    orderPrice,
    date,
    CONCAT(address, ' ', city, ' ', state) as Address
FROM Orders o
JOIN Client c USING(clientId)
JOIN Driver d USING(driverId)
WHERE o.clientId = 2;


