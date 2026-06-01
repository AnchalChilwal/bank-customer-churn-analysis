# Bank Customer Churn Analysis

## Brief Summary
A data analytics project focused on identifying customer distribution among segments and uncovering key factors influencing customer churn in the banking sector by using SQL Server and Power BI.

## Overview
Customer churn is a major challenge for banks as retaining existing customers is more cost-effective than acquiring new ones.
This project analyzes customer demographics,identifying churn drivers and provide actionable business insights.

## Problem Statement
* Analyze customer demographics and customer distribution.
* Identify key factors contributing to customer churn.
* Provide insights to support customer retention strategies.

## Dataset
* Source: Maven Analytics- Bank Customer Churn.
* The data contains information regarding customers and their banking activities.

## Tools & Technologies
* SQL Server
* Power BI

## Methods
* Data Cleaning ,Validation and Transformation.
* Exploratory Data Analysis (EDA).
* Customer Demographic Analysis.
* Churn Rate Analysis.
* Dashboard Development.

## Key Insights
### Customer Demographic Insights
* The dataset contains 10,000 customers.
* Average customer age is 38.92 years.
* Average account balance is 76,485.89.
* Average credit score is 650.53.
* Average credit cards per customer is 0.71.
* Average banking products/services per customer is 1.53.
* 54.57% of customers are male.
* 50.1% of customers belong to the high-salary segment.
* 55.06% of customers are established customers (tenure > 4 years).
* The Mid-Age segment (31–45 years) represents the largest customer group, accounting for 59.21% of customers.
* 50.63% of customers belong to the Excellent Credit Score segment (>650).
* 47.99%  of customers belong to the high-balance segment(>100000)  and 50.84% of customers are taking only one service.
* 70.55% of customers are having credit cards.

### Churn Drivers Insights
* Inactive customers have a higher churn rate (26.85%) compared to active customers.
* Mature customers (46–60 years) exhibit the highest churn rate at 51.12%.
* Female customers churn more than male customers, with a churn rate of 25.07%.
* Newer customers are more likely to churn(21.01%),whereas a very slight difference is seen as established customer have churn rate of 19.85%.
* Credit card ownership shows little impact on customer churn.
* Credit score appears to have a limited influence on churn, with only minor differences across segments.
* Customers in the High Balance segment have the highest churn rate at 25.23%.
* Germany records the highest churn rate at 32.44%.
* Customers in the High Salary segment show the highest churn rate at 20.84% while a very little difference we can see in medium and low salary segment.

## SQL Queries
- [Data Cleaning](Bank-Churn-Analysis/SQL%20Queries/Bank%20Churn%20(01_Data%20_cleaning).sql)
- [Creating a New Table](Bank-Churn-Analysis/SQL%20Queries/Bank%20Churn(02_creating%20_a%20_new%20table%20).sql)
- [Inserting Cleaned Data](Bank-Churn-Analysis/SQL%20Queries/Bank%20Churn(03_Inserting%20_cleaned%20_data).sql)
- [EDA](Bank-Churn-Analysis/SQL%20Queries/Bank%20Churn(04_EDA).sql)

## Dashboard
![Overview Dashboard](Bank-Churn-Analysis/Dashboard/Overview(Page%201).png)
![Churn Drivers Analysis](Bank-Churn-Analysis/Dashboard/Churn%20Drivers%20Analysis(Page%202).png)

## PowerBI Dashboard
![Dashboard](Bank%20Customer%20Churn%20Dashboard.pbix)
## Results & Conclusion

* Customer churn is mainly driven my inactivity,age, low engagement(low service count) as well as geography.So these can be considered the primary factors causing churn.
* In contrast,factors like salary segemnt,credit card count and credit score have less impact on customer churn.



### Recommendations

* Increase engagement initiatives for inactive customers.
* Develop targeted retention programs for mature customers.
* Some geography-specific strategies should be taken.
* Promote additional banking products to high-balance customers.
* Implement personalized retention strategies for high-value customer segments.
* Most customers have higher credit score means bank is serving premium customers,so reward such as offers or premium services should be given so that they don't leave the bank.
* Most of the customers have credit cards which can be the  major factor contributing to revenue generation got bank,so credit cards with additional offers should be introduced.
* Further customer feedbacks should be taken timely to avoid churn.

## Author
**ANCHAL CHILWAL**

## Contact Info
* LinkedIn:(https://linkedin.com/in/anchal-chilwal-30b359408)
* GitHub:(https://github.com/AnchalChilwal)


