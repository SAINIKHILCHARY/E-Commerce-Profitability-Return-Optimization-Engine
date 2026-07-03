CREATE VIEW Net_Revenue_Reconciliation AS
SELECT
    TransactionNo,
    Date,
    ProductNo,
    ProductName,
    CustomerNo,
    Country,
    Price,
    Quantity,
    (Price * Quantity) AS Gross_Revenue,
    0 AS Return_Value,
    0 AS Shipping_Cost,
    (Price * Quantity) - 0 - 0 AS Net_Revenue
FROM Sales_Transaction;