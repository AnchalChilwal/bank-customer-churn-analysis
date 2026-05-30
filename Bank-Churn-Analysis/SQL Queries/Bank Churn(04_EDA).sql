
-----EXPLORATORY DATA ANALYSIS-----

--Finding key metrics--

--Total customers--
SELECT COUNT(CustomerID) AS Total_Customers
FROM Bank_Churn_Cleaned

--Average Age--
SELECT ROUND(AVG(CAST(Age AS FLOAT)),2) AS AvgAge
FROM Bank_Churn_Cleaned

--Average Tenure--
SELECT ROUND(AVG(CAST(Tenure_in_years AS FLOAT)),2) AS AvgTenure
FROM Bank_Churn_Cleaned

--Average Balance--
SELECT ROUND(AVG(CAST(Balance AS FLOAT)),2) AS AvgBalance
FROM Bank_Churn_Cleaned

--Average Credit Card Count--
SELECT ROUND(AVG(CAST(Credit_Card_Count AS FLOAT)),2) AS AvgCreditCardCount
FROM Bank_Churn_Cleaned

--Average Service Count--
SELECT ROUND(AVG(CAST(Service_Count AS FLOAT)),2) AS AvgServiceCount
FROM Bank_Churn_Cleaned

--Average CreditScore--
SELECT ROUND(AVG(CAST(Credit_Score AS FLOAT)),2) AS AvgCreditScore
FROM Bank_Churn_Cleaned

--Total active and inactive customers count--
SELECT Member_Status,
COUNT(CustomerID) AS Total_Customers
FROM Bank_Churn_Cleaned
GROUP BY Member_Status

--Total churn and non-churn customers count--
SELECT Churn_Status,
COUNT(CustomerID) AS Total_Customers
FROM Bank_Churn_Cleaned
GROUP BY Churn_Status

--OBJECTIVE 1-Analyzing factors influencing customers churn--

--Member Status vs Churn --
SELECT Member_Status,Churn_Status,
COUNT(CustomerID) AS Total_Customers
FROM Bank_Churn_Cleaned
GROUP BY Member_Status,Churn_Status

--Country vs Churn--
SELECT Country,Churn_Status,
COUNT(CustomerID) AS Total_Customers
FROM Bank_Churn_Cleaned
GROUP BY Country,Churn_Status

--Gender vs Churn
SELECT Gender,Churn_Status,
COUNT(CustomerID) AS Total_Customers
FROM Bank_Churn_Cleaned
GROUP BY Gender,Churn_Status

--Salary Segment vs Churn--
SELECT Salary_Segment,Churn_Status,
COUNT(CustomerID) AS Total_Customers
FROM Bank_Churn_Cleaned
GROUP BY Salary_Segment,Churn_Status

--Creating CustomerSegments View--
GO
CREATE VIEW Customer_Segments AS
(
SELECT *,
CASE WHEN Age BETWEEN 18 AND 30 THEN 'Young'
WHEN Age BETWEEN 31 AND 45 THEN 'Mid-Age'
WHEN Age BETWEEN 46 AND 60 THEN 'Mature'
ELSE 'Senior'
END AS AgeSegment,

CASE 
WHEN Credit_Score BETWEEN 350 AND 499 THEN 'Poor'
WHEN Credit_Score BETWEEN 500 AND 650 THEN 'Good'
ELSE 'Excellent'
END CreditStatus,

CASE 
WHEN Tenure_in_years BETWEEN 0 AND 4 THEN 'New Customers'
ELSE 'Established'
END Tenuregroups,

CASE 
WHEN Balance <50000 THEN 'Low balance'
WHEN Balance BETWEEN 50000 AND 100000 THEN 'Average balance'
ELSE 'High balance'
END Balancegroups
FROM Bank_Churn_Cleaned)
GO

--AgeSegment vs Churn--
SELECT AgeSegment,Churn_Status,
COUNT(CustomerID) Total_Customer
FROM Customer_Segments
GROUP BY AgeSegment,Churn_Status

--Credit Score Segment vs Churn--
SELECT CreditStatus,Churn_Status,
COUNT(CustomerID) Total_Customer
FROM Customer_Segments
GROUP BY CreditStatus,Churn_Status

--Tenure Segment vs Churn--
SELECT Tenuregroups,Churn_Status,
COUNT(CustomerID) Total_Customer
FROM Customer_Segments
GROUP BY Tenuregroups,Churn_Status

--Balance Segment vs Churn--
SELECT Balancegroups,Churn_Status,
COUNT(CustomerID) Total_Customer
FROM Customer_Segments
GROUP BY Balancegroups,Churn_Status

--Service count vs Churn--
SELECT Service_Count,Churn_Status,
COUNT(CustomerID) AS Total_Customers
FROM Bank_Churn_Cleaned
GROUP BY Service_Count,Churn_Status

--Credit card count vs Churn--
SELECT Credit_Card,Churn_Status,
COUNT(CustomerID) AS Total_Customers
FROM 
(SELECT CustomerID,Churn_Status,CASE 
WHEN Credit_Card_Count= 0 THEN 'No card'
WHEN Credit_Card_Count= 1 THEN 'Has Card'
ELSE 'Unknown'
END Credit_Card
FROM Bank_Churn_Cleaned) AS Credit_Card
GROUP BY Credit_Card,Churn_Status


--OBJECTIVE 2-Customer distribution--
--Member status and total customers--
SELECT Member_Status,
COUNT(CustomerID) AS Total_Customers
FROM Bank_Churn_Cleaned
GROUP BY Member_Status

--Salary segment and total customers--
SELECT Salary_Segment,
COUNT(CustomerID) AS Total_Customers
FROM Bank_Churn_Cleaned
GROUP BY Salary_Segment

--Churn Status and total customers--
SELECT Churn_Status,
COUNT(CustomerID) AS Total_Customers
FROM Bank_Churn_Cleaned
GROUP BY Churn_Status

--Country and total customers--
SELECT Country,
COUNT(CustomerID) AS Total_Customers
FROM Bank_Churn_Cleaned
GROUP BY Country

--Gender and total customers--
SELECT Gender,
COUNT(CustomerID) AS Total_Customers
FROM Bank_Churn_Cleaned
GROUP BY Gender

-- Highest CreditScore and total customers--
SELECT Credit_Score,
COUNT(CustomerID) AS Total_Customers
FROM Bank_Churn_Cleaned
WHERE Credit_Score =(SELECT MAX(Credit_Score) AS Highest_Creditscore
FROM Bank_Churn_Cleaned)
GROUP BY Credit_Score

--Lowest CreditScore and total customers--
SELECT Credit_Score,
COUNT(CustomerID) AS Total_Customers
FROM bank_Churn_Cleaned
WHERE Credit_Score=(SELECT MIN(Credit_Score) AS Lowest_Creditscore
FROM Bank_Churn_Cleaned)
GROUP BY Credit_Score

--Credit status and total customers--
SELECT CreditStatus,
COUNT(CustomerID) AS Total_Customers
FROM Customer_Segments
GROUP BY CreditStatus

--Highest Age and total customers--
SELECT Age,
COUNT(CustomerID) AS Total_Customers
FROM Bank_Churn_Cleaned
WHERE Age =(SELECT MAX(Age) AS Highest_Age
FROM Bank_Churn_Cleaned)
GROUP BY Age

--Lowest age and total customers--
SELECT Age,
COUNT(CustomerID) AS Total_Customers
FROM bank_Churn_Cleaned
WHERE Age=(SELECT MIN(Age) AS Lowest_Age
FROM Bank_Churn_Cleaned)
GROUP BY Age

--AgeSegment and total customers--
SELECT AgeSegment,
COUNT(*) AS Total_Customers
FROM Customer_Segments
GROUP BY AgeSegment

-- Highest tenure and total customers--
SELECT Tenure_in_years,
COUNT(CustomerID) AS Total_Customers
FROM Bank_Churn_Cleaned
WHERE Tenure_in_years =(SELECT MAX(Tenure_in_years) AS Highest_Tenure_in_years
FROM Bank_Churn_Cleaned)
GROUP BY Tenure_in_years

-- Lowest tenure and total customers--
SELECT Tenure_in_years,
COUNT(CustomerID) AS Total_Customers
FROM Bank_Churn_Cleaned
WHERE Tenure_in_years =(SELECT MIN(Tenure_in_years) AS Lowest_Tenure_in_years
FROM Bank_Churn_Cleaned)
GROUP BY Tenure_in_years

--Tenuregroups and total customers--
SELECT Tenuregroups,
COUNT(CustomerID) AS Total_Customers
FROM Customer_Segments
GROUP BY Tenuregroups


-- Highest balance--
SELECT MAX(Balance) AS Maximum_balance
FROM Bank_Churn_Cleaned

-- Lowest balance and total customers--
SELECT Balance,
COUNT(CustomerID) AS Total_Customers
FROM Bank_Churn_Cleaned
WHERE Balance =(SELECT MIN(Balance) AS Minimum_Balance
FROM Bank_Churn_Cleaned)
GROUP BY Balance

--Balancegroups and total customers--
SELECT Balancegroups,
COUNT(CustomerID) AS Total_Customers
FROM Customer_Segments
GROUP BY Balancegroups


--Finding maximum and minimum  service count
SELECT
MAX(Service_Count) AS Maximum_service,
MIN(Service_Count) AS Minimum_service
FROM Bank_Churn_Cleaned

--Finding  total customers per service count--
SELECT Service_Count,
COUNT(*) AS CustomerCount
FROM Bank_Churn_Cleaned
GROUP BY Service_Count
ORDER BY Service_Count

--Finding maximum and minimum card count
SELECT
MAX(Credit_Card_Count) AS Maximium_credit_card,
MIN(Credit_Card_Count) AS Minimum_credit_card,
AVG(Credit_Card_Count) AS Avg_credit_card
FROM Bank_Churn_Cleaned

--Finding total customers credit card segment wise--
SELECT Credit_Card,
COUNT(CustomerID) AS Total_Customers
FROM (SELECT CustomerID,CASE 
WHEN Credit_Card_Count= 0 THEN 'No card'
WHEN Credit_Card_Count= 1 THEN 'Has Card'
ELSE 'Unknown'
END Credit_Card
FROM Bank_Churn_Cleaned) AS Credit_Card
GROUP BY Credit_Card

