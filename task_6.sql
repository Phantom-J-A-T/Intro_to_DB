CREATE DATABASE IF NOT EXISTS alx_book_store;

USE alx_book_store;


CREATE TABLE IF NOT EXISTS Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

CREATE TABLE IF NOT EXISTS Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    publication_date DATE,
    price DOUBLE NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);


CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE ,
    address TEXT 
);

CREATE TABLE IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE IF NOT EXISTS Order_Details(
    orderdetailid INT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);


INSERT INTO customers (customer_id, customer_name, email, address) 
VALUES(1,"Cole Baidoo", "cbaidoo@sandtech.com", " 123 Happiness Ave."),
(2,"Blessing Malik", "bmalik@sandtech.com", " 124 Happiness  Ave."),
(3,"Obed Ehoneah", "eobed@sandtech.com", " 125 Happiness  Ave."),
(4,"Nehemial Kamolu", "nkamolu@sandtech.com", " 126 Happiness  Ave.");