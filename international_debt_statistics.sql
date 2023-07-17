select *
from ..international_debt

---Finding the number of distinct countries---
select COUNT(distinct(country_name)) as total_distinct_country
from ..international_debt

---Finding out the distinct debt indicators---
select distinct(indicator_name) as distinct_indicators
from ..international_debt
group by indicator_name
order by distinct_indicators

---Totaling the amount of debt owed by the countries---
select round(SUM(debt)/1000000,2) as total_debt
from ..international_debt

---Country with the highest debt---
select country_name, round(SUM(debt)/1000000,2) as total_debt
from ..international_debt
group by country_name
order by total_debt desc
offset 0 rows
fetch next 1 rows only

---Average amount of debt across indicators---
select indicator_code,indicator_name,ROUND(avg(debt)/1000000,1) as AVG_Debt
from ..international_debt
group by indicator_code,indicator_name
order by AVG_Debt desc
offset 0 rows
fetch next 10 rows only

---The highest amount of principal repayments---
select indicator_code,indicator_name,country_name,ROUND(sum(debt)/1000000,2) as total_debt
from ..international_debt
group by indicator_code,indicator_name,country_name
having indicator_code = 'DT.AMT.DLXF.CD'
order by total_debt desc

--The most common debt indicator---
select indicator_name,COUNT(indicator_code) as total_count
from ..international_debt
group by indicator_name,indicator_code
order by total_count desc
offset 0 rows
fetch next 10 rows only
