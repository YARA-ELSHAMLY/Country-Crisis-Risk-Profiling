--1 Top 10 Disaster Types Globally
SELECT TOP 10 [Disaster_Type], COUNT(*) AS Disaster_Count
FROM [dbo].[cleaned_disaster_events.csv]
GROUP BY [Disaster_Type]
ORDER BY Disaster_Count DESC;

--2 Number of Disaster Events per Year
SELECT Year, COUNT(*) AS Disaster_Count
FROM [dbo].[cleaned_disaster_events.csv]
GROUP BY Year
ORDER BY Year;

--3 Disasters per Continent by Type
SELECT Continent, [Disaster_Type], COUNT(*) AS Disaster_Count
FROM [dbo].[cleaned_disaster_events.csv]
GROUP BY Continent, [Disaster_Type]
ORDER BY Continent, Disaster_Count DESC;

--4 Disasters by Year and Continent
SELECT Year, Continent, COUNT(*) AS Disaster_Count
FROM [dbo].[cleaned_disaster_events.csv]
GROUP BY Year, Continent
ORDER BY Year, Disaster_Count DESC;



--5 Top 10 Countries with Most Disaster Events
SELECT TOP 10 Country, COUNT(*) AS Number_of_Disasters
FROM [dbo].[cleaned_disaster_events.csv]
GROUP BY Country
ORDER BY Number_of_Disasters DESC;


--6 Disaster Types per Country (Example: India)
SELECT [Disaster_Type], COUNT(*) AS Disaster_Count
FROM [dbo].[cleaned_disaster_events.csv]
WHERE Country = 'India'
GROUP BY [Disaster_Type]
ORDER BY Disaster_Count DESC;

--7 Countries with highest disaster frequency (2010–2021)
SELECT Country, COUNT(*) AS Disaster_Count
FROM [dbo].[cleaned_disaster_events.csv]
WHERE Year >= 2010
GROUP BY Country
ORDER BY Disaster_Count DESC;

--8 Countries Most Affected by Multiple Disaster Types
SELECT Country, COUNT(DISTINCT [Disaster_Type]) AS Disaster_Type_Count
FROM [dbo].[cleaned_disaster_events.csv]
GROUP BY Country
ORDER BY Disaster_Type_Count DESC;



--9 Top 10 Countries with Highest Total Deaths
SELECT TOP 10 Country, SUM([Total_Deaths]) AS Total_Deaths
FROM [dbo].[cleaned_disaster_events.csv]
GROUP BY Country
ORDER BY Total_Deaths DESC;

--10 Top 10 Countries by Total Affected Population
SELECT TOP 10 Country, SUM([Total_Affected]) AS Total_Affected
FROM [dbo].[cleaned_disaster_events.csv]
GROUP BY Country
ORDER BY Total_Affected DESC;

--11 Most Damaging Disasters (Economic Losses)
SELECT TOP 10 Country, [Disaster_Type], Year, [Total_Damages_000_US]
FROM [dbo].[cleaned_disaster_events.csv]
ORDER BY [Total_Damages_000_US] DESC;

--12 Average Number of Deaths per Disaster Type
SELECT [Disaster_Type], AVG([Total_Deaths]) AS Avg_Deaths
FROM [dbo].[cleaned_disaster_events.csv]
GROUP BY [Disaster_Type]
ORDER BY Avg_Deaths DESC;

--13 Countries with Frequent Disasters but Low Average Deaths
SELECT TOP 10 Country, COUNT(*) AS Total_Disasters, AVG([Total_Deaths]) AS Avg_Deaths
FROM [dbo].[cleaned_disaster_events.csv]
GROUP BY Country
HAVING COUNT(*) > 20
ORDER BY Avg_Deaths ASC;



--14 Yearly Trend of a Specific Disaster Type (Example: Flood)
SELECT Year, COUNT(*) AS Disaster_Count
FROM [dbo].[cleaned_disaster_events.csv]
WHERE [Disaster_Type] = 'Flood'
GROUP BY Year
ORDER BY Year;

--15 Disasters with Highest Severity Score
SELECT Country, [Disaster_Type], Year,
       ([Total_Deaths] + [Total_Affected]/1000 + [Total_Damages_000_US]/1000000) AS Severity_Score
FROM [dbo].[cleaned_disaster_events.csv]
ORDER BY Severity_Score DESC;














