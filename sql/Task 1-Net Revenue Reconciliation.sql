SET GLOBAL local_infile = 1;
USE project_sql;


DROP TABLE IF EXISTS sales_transactions;

CREATE TABLE sales_transactions (
    TransactionNo VARCHAR(20),
    `Date` VARCHAR(20),
    ProductNo VARCHAR(20),
    ProductName VARCHAR(255),
    Price DECIMAL(10,2),
    Quantity INT,
    CustomerNo VARCHAR(50),
    Country VARCHAR(100)
);

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Sales Transaction.csv'
INTO TABLE sales_transactions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

SELECT COUNT(*) AS total_rows
FROM sales_transactions;

SELECT *
FROM sales_transactions;