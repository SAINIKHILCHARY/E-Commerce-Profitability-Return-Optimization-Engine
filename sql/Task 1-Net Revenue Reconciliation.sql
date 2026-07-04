-- Create the database for the project
CREATE DATABASE project_sql;

-- Use the created database
USE project_sql;

-- Create a table to store sales transaction details
CREATE TABLE salestransaction (
    TransactionNo VARCHAR(20),
    Date VARCHAR(20),
    ProductNo VARCHAR(20),
    ProductName VARCHAR(255),
    Price DECIMAL(10,2),
    Quantity INT,
    CustomerNo VARCHAR(20),
    Country VARCHAR(100)
);