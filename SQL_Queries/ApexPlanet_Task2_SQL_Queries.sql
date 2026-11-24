USE apexplanet_task2;


-- 1. Total Records
SELECT COUNT(*) AS Total_Records
FROM sales;


-- 2. Missing Values
SELECT
    COUNT(*) AS Total_Records,
    SUM(Age IS NULL) AS Missing_Age,
    SUM(City IS NULL) AS Missing_City
FROM sales;


-- 3. Duplicate / Repeated Order_ID
SELECT
    Order_ID,
    COUNT(*) AS Order_Count
FROM sales
GROUP BY Order_ID
HAVING COUNT(*) > 1;


-- 4. Total Sales
SELECT
    SUM(Total_Sales) AS Total_Sales
FROM sales;


-- 5. Date Range
SELECT
    COUNT(*) AS Total_Records,
    MIN(STR_TO_DATE(Order_Date, '%d-%m-%Y')) AS Start_Date,
    MAX(STR_TO_DATE(Order_Date, '%d-%m-%Y')) AS End_Date
FROM sales;


-- 6. Sales by Category
SELECT
    Category,
    COUNT(*) AS Orders,
    ROUND(SUM(Total_Sales), 2) AS Total_Sales
FROM sales
GROUP BY Category
ORDER BY Total_Sales DESC;


-- 7. Sales by Gender
SELECT
    Gender,
    COUNT(*) AS Orders,
    ROUND(SUM(Total_Sales), 2) AS Total_Sales
FROM sales
GROUP BY Gender
ORDER BY Total_Sales DESC;


-- 8. Sales by City
SELECT
    City,
    COUNT(*) AS Orders,
    ROUND(SUM(Total_Sales), 2) AS Total_Sales
FROM sales
GROUP BY City
ORDER BY Total_Sales DESC;


-- 9. Sales by Product
SELECT
    Product,
    COUNT(*) AS Orders,
    ROUND(SUM(Total_Sales), 2) AS Total_Sales
FROM sales
GROUP BY Product
ORDER BY Total_Sales DESC;


-- 10. Top Customers by Sales
SELECT
    Customer_ID,
    Customer_Name,
    ROUND(SUM(Total_Sales), 2) AS Total_Sales
FROM sales
GROUP BY Customer_ID, Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;


-- 11. Customers with Most Orders
SELECT
    Customer_ID,
    COUNT(*) AS Order_Count
FROM sales
GROUP BY Customer_ID
ORDER BY Order_Count DESC
LIMIT 10;


-- 12. Average Order Value
SELECT
    ROUND(AVG(Total_Sales), 2) AS Average_Order_Value
FROM sales;


-- 13. Monthly Sales
SELECT
    DATE_FORMAT(
        STR_TO_DATE(Order_Date, '%d-%m-%Y'),
        '%Y-%m'
    ) AS Month,
    COUNT(*) AS Orders,
    ROUND(SUM(Total_Sales), 2) AS Total_Sales
FROM sales
GROUP BY Month
ORDER BY Month;


-- 14. Sales by Category - Average Order Value
SELECT
    Category,
    COUNT(*) AS Orders,
    ROUND(AVG(Total_Sales), 2) AS Average_Order_Value
FROM sales
GROUP BY Category
ORDER BY Average_Order_Value DESC;


-- 15. Overall Quantity and Sales Metrics
SELECT
    SUM(Quantity) AS Total_Quantity_Sold,
    ROUND(AVG(Quantity), 2) AS Average_Quantity_Per_Order,
    ROUND(SUM(Total_Sales), 2) AS Total_Sales,
    ROUND(AVG(Unit_Price), 2) AS Average_Unit_Price
FROM sales;


-- 16. Quantity Sold by Product
SELECT
    Product,
    SUM(Quantity) AS Total_Quantity_Sold
FROM sales
GROUP BY Product
ORDER BY Total_Quantity_Sold DESC;


-- 17. Average Sales per Order by Gender
SELECT
    Gender,
    COUNT(*) AS Orders,
    ROUND(AVG(Total_Sales), 2) AS Average_Sales_Per_Order
FROM sales
GROUP BY Gender
ORDER BY Average_Sales_Per_Order DESC;


-- 18. Sales by Gender and Category
SELECT
    Gender,
    Category,
    COUNT(*) AS Orders,
    ROUND(SUM(Total_Sales), 2) AS Total_Sales
FROM sales
GROUP BY Gender, Category
ORDER BY Total_Sales DESC;
