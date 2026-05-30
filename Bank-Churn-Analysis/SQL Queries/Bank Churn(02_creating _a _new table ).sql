--Creating a new table to store cleaned dataset details--
DROP TABLE IF EXISTS Bank_Churn_Cleaned;
GO
CREATE TABLE Bank_Churn_Cleaned(
CustomerID INT PRIMARY KEY,
Credit_Score INT,
Country VARCHAR(50),
Gender VARCHAR(10),
Age INT,
Tenure_in_years INT,
Balance FLOAT,
Service_Count INT,
Credit_Card_Count INT,
Member_Status VARCHAR(50),
Salary_Segment VARCHAR(50),
Churn_Status VARCHAR(50)
)

SELECT* FROM Bank_Churn_Cleaned --View your new table--
