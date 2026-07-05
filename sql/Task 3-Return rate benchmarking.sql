-- Create the database for the project
CREATE DATABASE project_sql;

-- Use the created database
USE project_sql;

-- Return Rate Benchmarking

SELECT
    ProductNo,
    ProductName,
    COUNT(*) AS Total_Transactions,
    SUM(CASE
            WHEN TransactionNo LIKE 'C%' THEN 1
            ELSE 0
        END) AS Returned_Transactions,
    ROUND(
        SUM(CASE
                WHEN TransactionNo LIKE 'C%' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
        2
    ) AS Return_Rate_Percentage
FROM salestransaction
GROUP BY ProductNo, ProductName
ORDER BY Return_Rate_Percentage DESC;

-- Find Products with Return Rate Above Overall Average
WITH ProductReturnRate AS (
    SELECT
        ProductNo,
        ProductName,
        COUNT(*) AS Total_Transactions,
        SUM(CASE
                WHEN TransactionNo LIKE 'C%' THEN 1
                ELSE 0
            END) AS Returned_Transactions,
        SUM(CASE
                WHEN TransactionNo LIKE 'C%' THEN 1
                ELSE 0
            END) * 1.0 / COUNT(*) AS Return_Rate
    FROM salestransaction
    GROUP BY ProductNo, ProductName
)

SELECT *
FROM ProductReturnRate
WHERE Return_Rate >
(
    SELECT AVG(Return_Rate)
    FROM ProductReturnRate
)
ORDER BY Return_Rate DESC;

-- Find Products with Return Rate More Than 2× the Average

WITH ProductReturnRate AS (
    SELECT
        ProductNo,
        ProductName,
        COUNT(*) AS Total_Transactions,
        SUM(CASE
                WHEN TransactionNo LIKE 'C%' THEN 1
                ELSE 0
            END) AS Returned_Transactions,
        SUM(CASE
                WHEN TransactionNo LIKE 'C%' THEN 1
                ELSE 0
            END) * 1.0 / COUNT(*) AS Return_Rate
    FROM salestransaction
    GROUP BY ProductNo, ProductName
)

SELECT *
FROM ProductReturnRate
WHERE Return_Rate >
(
    SELECT 2 * AVG(Return_Rate)
    FROM ProductReturnRate
)
ORDER BY Return_Rate DESC;