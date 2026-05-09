--1. What is the overall churn rate?
-- to calculate it we must find percentage of CSTs who have left/ total CSTs that exist.
-- we multiply in 1.0 to change the number into decimal
-- we multiply in 100 in last step to change it to %
CREATE VIEW 
    Overall_Churn_Rate AS SELECT 
    ((SELECT COUNT(*) * 1.0 FROM Bank_Activity WHERE Churn_status = 'Attrited Customer') 
    / 
    (SELECT COUNT(*) FROM customer)) * 100 AS Churn_Rate_Percent;
    GO
--2. What is the average age of customers?
--used cast here to treat the age as float not an integer for more accuracy
CREATE VIEW AVG_AGE AS
Select avg(Cast(age as float)) as avg_age
From Customer;
GO
--3. What is the average credit card utilization ratio?
--The utilization ratio is: ( Revolving Balance / Credit Limit).
CREATE VIEW AVG_Credit AS
SELECT 
    AVG(Revolving_Balance * 1.0 / Credit_Limit) AS Avg_Utilization_Ratio
FROM 
    Bank_Activity;
    GO
--4. What is the churn rate per income range?
Create View Churn_Rate AS
SELECT 
    t2.Income_range, 
    (COUNT(t1.Churn_status) * 1.0 / (SELECT COUNT(*) FROM Bank_Activity WHERE Churn_status = 'Attrited Customer')) * 100 AS Churn_Percentage
FROM Bank_Activity AS t1
JOIN customer AS t2 ON t1.Customer_ID = t2.Customer_ID
WHERE t1.Churn_status = 'Attrited Customer'
GROUP BY t2.Income_range;
GO
--5. What is the distribution of card types?
CREATE VIEW Card_Types_Dis AS
SELECT 
    Card_Type, 
    COUNT(*) AS Total_Count
FROM Bank_Activity
GROUP BY Card_Type;
GO
--6. Monthly trend of total transactions (if date available)<<
GO 
CREATE VIEW View_Monthly_Transaction AS
SELECT 
    Tenure_Months,
    COUNT(Customer_ID) AS Total_Customers,
    SUM(Total_Transaction_Amount) AS Sum_Transaction_Value,
    SUM(Total_Transaction_Count) AS Total_Transaction_Volume,
    -- Calculating average spend per customer at this tenure stage
    AVG(CAST(Total_Transaction_Amount AS DECIMAL(18,2))) AS Avg_Spend_Per_Customer
FROM Bank_Activity
GROUP BY Tenure_Months;
GO
--7. Relationship between credit limit and revolving balance <<
CREATE VIEW Credit_Limits AS
SELECT
    Customer_ID,
    Credit_Limit,
    Revolving_Balance,
    Available_Credit
FROM Bank_Activity;
GO
--8. Avg. customer service calls per churned user
CREATE VIEW Churn_Call_Avg AS
SELECT 
    Churn_Status,
    AVG(Customer_Service_Calls) AS Avg_CST_Calls
FROM Bank_Activity
WHERE Churn_Status = 'Attrited Customer' 
GROUP BY Churn_Status;
GO
--9. Avg. inactive months per user
CREATE VIEW Inactivity_Avg AS
SELECT 
    AVG(CAST(Inactive_Months_Last_Year AS FLOAT)) AS Avg_Inactive_Months
FROM Bank_Activity;
GO

--10. Education level of churned customers
CREATE VIEW vw_Churn_Education_Profile AS
SELECT
    C.Education_level,
   COUNT(B.Churn_Status) AS Churned_CST
FROM Bank_Activity AS B
Join Customer AS C ON B.Customer_ID = C.Customer_ID
WHERE Churn_Status = 'Attrited Customer'
GROUP BY C.Education_Level ;
