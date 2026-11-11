CREATE DATABASE Product_Review_DB;
USE Product_Review_DB;



CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50)
);

INSERT INTO Customer VALUES
(1, 'John'),
(2, 'Priya'),
(3, 'Ravi');



CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50)
);

INSERT INTO Product VALUES
(101, 'Laptop'),
(102, 'Mobile'),
(103, 'Headphones');

CREATE TABLE Review (
    Review_ID VARCHAR(10) PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Rating INT NOT NULL,
    Review_Text VARCHAR(255),
    Review_Date DATE NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    CHECK (Rating BETWEEN 1 AND 5)
);

INSERT INTO Review VALUES
('R101', 1, 101, 5, 'Excellent performance', '2026-11-01'),
('R102', 2, 102, 4, 'Good battery life', '2026-11-02'),
('R103', 3, 103, 3, 'Average quality', '2026-11-03'),
('R104', 1, 102, 5, 'Very good product', '2026-11-04');

UPDATE Review
SET Review_Text = 'Excellent quality'
WHERE Review_ID = 'R101';



DELETE FROM Review
WHERE Review_ID = 'R103';

SELECT Product_Name, Rating, Review_Text
FROM Product
JOIN Review
ON Product.Product_ID = Review.Product_ID;

SELECT Customer_Name, Review_Text, Rating
FROM Customer
JOIN Review
ON Customer.Customer_ID = Review.Customer_ID;

SELECT * FROM Review
ORDER BY Review_Date DESC;

SELECT * FROM Review
WHERE Rating > 4;

SELECT Product_ID, AVG(Rating) AS Average_Rating
FROM Review
GROUP BY Product_ID;

SELECT Product_ID, COUNT(*) AS Total_Reviews
FROM Review
GROUP BY Product_ID;

SELECT Product_Name, AVG(Rating) AS Average_Rating
FROM Product
JOIN Review
ON Product.Product_ID = Review.Product_ID
GROUP BY Product.Product_ID, Product_Name
HAVING AVG(Rating) > 4;

SELECT Product_Name,
COUNT(Review_ID) AS Total_Reviews,
AVG(Rating) AS Average_Rating
FROM Product
LEFT JOIN Review
ON Product.Product_ID = Review.Product_ID
GROUP BY Product.Product_ID, Product_Name;

SELECT Rating, COUNT(*) AS Total
FROM Review
GROUP BY Rating;