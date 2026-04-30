--Usage:
SELECT
*
FROM dbo.superstore;

--Total Revenue by Category
SELECT
	Sub_Category,
	SUM(Sales) AS Total_Sales
FROM dbo.superstore 
GROUP BY Sub_Category
ORDER BY SUM(Sales) DESC;

--Profit and Revenue by Category
SELECT
	Category,
	SUM(Sales) AS Total_Sales
FROM dbo.superstore 
GROUP BY Category
ORDER BY SUM(Sales) DESC;

--Profit by Region
SELECT
	Country_Region,
	SUM(Profit) AS Total_Profit
FROM dbo.superstore
GROUP BY Country_Region
ORDER BY SUM(Profit) DESC;

--Monthly Sales Trend
SELECT
	DATENAME(MONTH, Order_Date),
	SUM(Sales) AS Total_Sales
FROM dbo.superstore
GROUP BY DATENAME(MONTH, Order_Date)
ORDER BY SUM(Sales) DESC;

--Total Revenue, Profit and Orders
SELECT
	SUM(Sales) AS Total_Sales,
	SUM(Profit) AS Total_Profit,
	Count(DISTINCT Order_ID) AS Total_Orders
FROM dbo.superstore;

--Revenue by Region
SELECT
	Country_Region,
	SUM(Sales) AS Total_Sales
FROM dbo.superstore
GROUP BY Country_Region
ORDER BY SUM(Sales) DESC;

--Which sub-categories lose money?
SELECT 
	Sub_Category, 
	ROUND(SUM(Sales), 2) AS Total_Sales, 
	ROUND(SUM(Profit), 2) AS Total_Profit 
FROM dbo.superstore 
GROUP BY Sub_Category 
HAVING SUM(Profit) < 0 
ORDER BY SUM(Profit); 

--Are discounts hurting profit? 
SELECT 
	CAST(Discount * 100 AS VARCHAR) + '%' AS Discount, 
	ROUND(SUM(Profit), 2) AS Total_Profit, 
	ROUND(SUM(Sales), 2) AS Total_Sales 
FROM dbo.superstore 
GROUP BY Discount 
ORDER BY Discount; 

--Which category has best margin? 
SELECT 
	Category, 
	ROUND(SUM(Sales), 2) AS Total_sales, 
	ROUND(SUM(profit), 2) AS Total_profit, 
	CAST(ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS VARCHAR) + '%' AS Profit_margin 
FROM dbo.superstore 
GROUP BY Category 
ORDER BY SUM(profit) DESC; 

--Which customer segment is most valuable?
SELECT 
	Segment, 
	ROUND(SUM(Sales), 2) AS Total_sales, 
	ROUND(SUM(profit), 2) AS Total_profit 
FROM dbo.superstore 
GROUP BY Segment;
