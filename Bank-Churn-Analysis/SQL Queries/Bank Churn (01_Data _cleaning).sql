
----DATA VALIDATION AND CLEANING----
/* 
1.Checking for nulls in Primary key
*/
SELECT  CustomerID
FROM Bank_Churn
WHERE CustomerID IS NULL

/*
2.Checking for duplicates in Primary key
*/
SELECT CustomerID,
COUNT(*) AS Total_Customers
FROM Bank_Churn
GROUP BY CustomerID
HAVING COUNT(*) >1

/* 
3.Checking for nulls in Credit score column
*/
SELECT  CreditScore
FROM Bank_Churn
WHERE CreditScore IS NULL

--Checking distinct Credit score column--
SELECT DISTINCT(CreditScore)
FROM Bank_Churn
ORDER BY CreditScore DESC

/*
4.Checking for data format for Geography Column 
*/
SELECT DISTINCT Geography
FROM Bank_Churn

/*
5.Checking for data format for Gender Column 
*/
SELECT DISTINCT Gender
FROM Bank_Churn

/*
6.Checking for nulls in age column
*/
SELECT Age
FROM Bank_Churn
WHERE Age IS NULL

/*
7. Finding Customers under 18 and checking for unrealistic ages--
*/
SELECT Age
FROM Bank_Churn
WHERE Age <18 OR
Age NOT BETWEEN 18 AND 100

/*
8.Rounding balance column values to 2 decimal places 
*/
SELECT
ROUND(Balance,2) AS Balance
FROM Bank_Churn

--Checking negative balance--
SELECT *
FROM Bank_Churn
WHERE Balance < 0

/*
9.Changing 1 to 'active' and 0 to 'inactive' in IsActiveMember
*/
SELECT 
CASE WHEN IsActiveMember = 1 THEN 'Active'
WHEN IsActiveMember = 0 THEN 'Inactive'
ELSE 'Not a Member'
END Active_Member
FROM Bank_Churn

/*10.
Rounding Salary column values to 2 decimal places
*/
SELECT
ROUND(EstimatedSalary,2) AS EstimatedSalary
FROM Bank_Churn

/*
11.Segregating salary into high,medium and low
*/
SELECT CASE
WHEN EstimatedSalary < 50000 THEN 'Low'
WHEN EstimatedSalary BETWEEN 50000 AND 100000 THEN 'Medium'
ELSE 'High'
END  AS Salary_Segment
FROM Bank_Churn

/*
12. Changing 1 to left and 0 to stay to show customer churn status in exited column
*/
SELECT 
CASE WHEN Exited = 1 THEN 'Left'
WHEN Exited = 0 THEN 'Stays'
ELSE 'Not a member'
END  AS Churn_Status
FROM Bank_Churn

/*
12. Checking for values in tenure column--
*/
SELECT DISTINCT(Tenure)
FROM Bank_Churn

/*View our clean data*/
SELECT * FROM Bank_Churn

