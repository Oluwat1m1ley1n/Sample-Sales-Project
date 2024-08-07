SELECT TOP (1000) [ORDERNUMBER]
      ,[QUANTITYORDERED]
      ,[PRICEEACH]
      ,[ORDERLINENUMBER]
      ,[SALES]
      ,[ORDERDATE]
      ,[STATUS]
      ,[QTR_ID]
      ,[MONTH_ID]
      ,[YEAR_ID]
      ,[PRODUCTLINE]
      ,[CUSTOMERNAME]
      ,[ADDRESSLINE1]
      ,[ADDRESSLINE2]
      ,[CITY]
      ,[STATE]
      ,[POSTALCODE]
      ,[COUNTRY]
      ,[CONTACTLASTNAME]
      ,[CONTACTFIRSTNAME]
      ,[FULLNAME]
  FROM [WorkTable].[dbo].['sales_data_sample 2$']


--Merging contactfirst and lastname together

 ALTER TABLE [WorkTable].[dbo].['sales_data_sample 2$']
 ADD FULLNAME VARCHAR (100)
 --Running A Check On The Funtion Before Updating.
Select CONTACTFIRSTNAME + ' ' +CONTACTLASTNAME as FULLNAME
From [WorkTable].[dbo].['sales_data_sample 2$'] 
 --Then update,check is completed
 UPDATE  [WorkTable].[dbo].['sales_data_sample 2$']
SET FULLNAME = CONTACTFIRSTNAME + ' ' +CONTACTLASTNAME 
From [WorkTable].[dbo].['sales_data_sample 2$']

--Total Sales of Products

Select SUM(SALES)  AS Total_sales
From [WorkTable].[dbo].['sales_data_sample 2$']

--Sales By Productline (types of products)
Select Productline,Sum(Sales) As Total_Sales  
From [WorkTable].[dbo].['sales_data_sample 2$']
Group By Productline

--Average Sales of Products

Select Avg(SALES)  AS Average_sales
From [WorkTable].[dbo].['sales_data_sample 2$']

--Identifying The Highest And Lowest Sales Values
Select MAX(SALES) AS Max_Sales
From [WorkTable].[dbo].['sales_data_sample 2$']

Select MIN(SALES) AS Min_Sales
From [WorkTable].[dbo].['sales_data_sample 2$']
---Sales Trend Consecutively By Year
Select YEAR_ID,SUM(SALES) AS Total_Sales 
From [WorkTable].[dbo].['sales_data_sample 2$']
Group By YEAR_ID


---TOP 10 Sales Ranking By Country
Select TOP 10 COUNTRY,SUM(SALES) AS Total_Sales 
From [WorkTable].[dbo].['sales_data_sample 2$']
Group By COUNTRY
ORDER BY 2 DESC

--Top Customers Based On Sales
Select FULLNAME,CUSTOMERNAME as Companies_Name,SUM(SALES) AS Total_Spent 
From [WorkTable].[dbo].['sales_data_sample 2$']
Group By CUSTOMERNAME,FULLNAME
ORDER BY 3 DESC
--Sales order Based On Status
Select  CUSTOMERNAME,PRODUCTLINE,STATUS
From [WorkTable].[dbo].['sales_data_sample 2$']
 
