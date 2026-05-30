INSERT INTO Bank_Churn_Cleaned (
    CustomerID,
    Credit_Score,
    Country,
    Gender,
    Age,
    Tenure_in_years,
    Balance,
    Service_Count,
    Credit_Card_Count,
    Member_Status,
    Salary_Segment,
    Churn_Status
)
SELECT
    CustomerID,
    CreditScore AS Credit_Score,
    Geography,
    Gender,
    Age,
    Tenure AS Tenure_in_years,
    ROUND(Balance, 2) AS Balance,
    NumOfProducts AS Service_Count,
    HasCrCard AS Credit_Card_Count,
    CASE 
        WHEN IsActiveMember = 1 THEN 'Active'
        WHEN IsActiveMember = 0 THEN 'Inactive'
        ELSE 'Not a Member'
    END AS Member_Status,
    CASE
        WHEN EstimatedSalary < 50000 THEN 'Low'
        WHEN EstimatedSalary BETWEEN 50000 AND 100000 THEN 'Medium'
        ELSE 'High'
    END AS Salary_Segment,
    CASE 
        WHEN Exited = 1 THEN 'Left'
        WHEN Exited = 0 THEN 'Stays'
        ELSE 'Not a member'
    END AS Churn_Status
FROM Bank_Churn


