SELECT Date FROM Sales_Transaction LIMIT 10;

CREATE VIEW Customer_First_Purchase AS
SELECT
    CustomerNo,
    MIN(Date) AS First_Purchase_Date
FROM Sales_Transaction
GROUP BY CustomerNo;

SELECT
    CustomerNo,
    DATE_FORMAT(First_Purchase_Date,'%Y-%m') AS Cohort_Month
FROM Customer_First_Purchase
ORDER BY Cohort_Month;

WITH CustomerOrders AS
(
SELECT
    CustomerNo,
    Date,
    Price,
    Quantity,
    ROW_NUMBER() OVER(
        PARTITION BY CustomerNo
        ORDER BY Date
    ) AS Purchase_Number
FROM Sales_Transaction
)

SELECT
    CustomerNo,
    Date,
    Purchase_Number,
    Price*Quantity AS Revenue
FROM CustomerOrders;