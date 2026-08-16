CREATE TABLE Seller (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(200)
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY,
    seller_id INT,
    product_id INT,
    stock_quantity INT NOT NULL,
    status VARCHAR(20),

    FOREIGN KEY (seller_id)
        REFERENCES Seller(seller_id),

    FOREIGN KEY (product_id)
        REFERENCES Product(product_id)
);

INSERT INTO Seller
(seller_id, seller_name, email, phone, address)
VALUES
(1, 'Arun Traders', 'arun@gmail.com', '9876543210', 'Chennai'),
(2, 'Kumar Stores', 'kumar@gmail.com', '9876543211', 'Tindivanam'),
(3, 'Priya Enterprises', 'priya@gmail.com', '9876543212', 'Pondicherry'),
(4, 'Sri Electronics', 'srielectronics@gmail.com', '9876543213', 'Villupuram'),
(5, 'Digital World', 'digitalworld@gmail.com', '9876543214', 'Chengalpattu');

INSERT INTO Product
(product_id, product_name, category, price)
VALUES
(101, 'Laptop', 'Electronics', 55000.00),
(102, 'Keyboard', 'Accessories', 1200.00),
(103, 'Mouse', 'Accessories', 600.00),
(104, 'Headphones', 'Audio', 1500.00),
(105, 'Smart Watch', 'Wearable', 3500.00),
(106, 'Mobile Phone', 'Electronics', 25000.00),
(107, 'USB Cable', 'Accessories', 300.00),
(108, 'Bluetooth Speaker', 'Audio', 2200.00);

INSERT INTO Inventory
(inventory_id, seller_id, product_id, stock_quantity, status)
VALUES
(1, 1, 101, 10, 'Available'),
(2, 1, 102, 25, 'Available'),
(3, 1, 103, 0, 'Unavailable'),
(4, 2, 104, 15, 'Available'),
(5, 2, 105, 0, 'Unavailable'),
(6, 2, 106, 8, 'Available'),
(7, 3, 107, 40, 'Available'),
(8, 3, 108, 0, 'Unavailable'),
(9, 4, 101, 5, 'Available'),
(10, 4, 104, 12, 'Available'),
(11, 5, 105, 20, 'Available'),
(12, 5, 106, 0, 'Unavailable');

INSERT INTO Seller
(seller_id, seller_name, email, phone, address)
VALUES
(1, 'Arun Traders', 'arun@gmail.com', '9876543210', 'Chennai'),
(2, 'Kumar Stores', 'kumar@gmail.com', '9876543211', 'Tindivanam'),
(3, 'Priya Enterprises', 'priya@gmail.com', '9876543212', 'Pondicherry'),
(4, 'Sri Electronics', 'srielectronics@gmail.com', '9876543213', 'Villupuram'),
(5, 'Digital World', 'digitalworld@gmail.com', '9876543214', 'Chengalpattu');

SELECT * FROM Seller;

SELECT * FROM Product;

SELECT * FROM Inventory;

SELECT *
FROM Inventory
WHERE status = 'Available';

SELECT *
FROM Inventory
WHERE status = 'Unavailable';

SELECT
    Seller.seller_name,
    Product.product_name,
    Product.category,
    Product.price,
    Inventory.stock_quantity,
    Inventory.status
FROM Inventory
JOIN Seller
    ON Inventory.seller_id = Seller.seller_id
JOIN Product
    ON Inventory.product_id = Product.product_id;
    
SELECT
    Product.product_name,
    Seller.seller_name,
    Inventory.stock_quantity,
    Inventory.status
FROM Inventory
JOIN Product
    ON Inventory.product_id = Product.product_id
JOIN Seller
    ON Inventory.seller_id = Seller.seller_id
ORDER BY Inventory.stock_quantity DESC;

SELECT
    Product.product_name,
    Seller.seller_name,
    Inventory.stock_quantity
FROM Inventory
JOIN Product
    ON Inventory.product_id = Product.product_id
JOIN Seller
    ON Inventory.seller_id = Seller.seller_id
WHERE Inventory.stock_quantity < 10;

SELECT
    SUM(stock_quantity) AS Total_Stock
FROM Inventory;

SELECT
    COUNT(*) AS Available_Products
FROM Inventory
WHERE status = 'Available';

SELECT
    COUNT(*) AS Unavailable_Products
FROM Inventory
WHERE status = 'Unavailable';

SELECT
    Seller.seller_name,
    COUNT(Inventory.product_id) AS Total_Products,
    SUM(Inventory.stock_quantity) AS Total_Stock
FROM Seller
JOIN Inventory
    ON Seller.seller_id = Inventory.seller_id
GROUP BY Seller.seller_id, Seller.seller_name;

SELECT
    category,
    COUNT(*) AS Product_Count
FROM Product
GROUP BY category;

SELECT
    product_name,
    category,
    price
FROM Product
WHERE price > 5000
ORDER BY price DESC;