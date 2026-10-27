/*
6. SQL Tasks
After loading the data, write SQL queries to answer the following questions.
Task 1: Show the latest exchange rate for every currency.
Task 2: Calculate the average exchange rate by currency.
Task 3: Find the highest exchange rate recorded for every currency.
Task 4: Find the lowest exchange rate recorded for every currency.
Task 5: Calculate the monthly average exchange rate.
Task 6: Compare the latest exchange rate with the previous available rate.
Example output:Currency
Current Rate
Previous Rate
Change
Change %
*/



--Task 1

select 
	TargetCurrency,
	ExchangeRate,
	DateKey
from(
    select 
		TargetCurrency,
		ExchangeRate,
		DateKey,
		ExtractedAt,
		BaseCurrency,
		row_number() over (PARTITION BY TargetCurrency ORDER BY DateKey DESC) as RowNum
	from [dbo].[FactExchangeRate]
	where basecurrency = 'USD') as latestrate
where RowNum = 1


--Task 2: 

select 
	TargetCurrency,
	avg(exchangerate) as AvgRate
from [dbo].[FactExchangeRate]
group by TargetCurrency

--Task 3: 

select 
	TargetCurrency,
	max(ExchangeRate) as HighestRate
from [dbo].[FactExchangeRate]
group by TargetCurrency

--Task 4:

select 
	TargetCurrency,
	min(ExchangeRate) as LowestRate
from [dbo].[FactExchangeRate]
group by TargetCurrency

--Task 5:
select 
	d.Year,
	d.Month,
	d.MonthName,
	f.TargetCurrency,
	avg(f.exchangerate) as MonthlyAvgRate
from [dbo].[FactExchangeRate] as f
	left join [dbo].[DimDate] as d 
	on f.DateKey = d.DateKey
group by 	
	d.Year,
	d.Month,
	d.MonthName,
	f.TargetCurrency

--Task 6: 

with RateComparison as (
     select
        TargetCurrency,
        DateKey,
        ExchangeRate as CurrentRate,
        lag(ExchangeRate) over (
            partition by TargetCurrency
            order by DateKey
        ) AS PreviousRate,
        row_number() over (
            partition by TargetCurrency
            order by DateKey desc
        ) AS RowNum
    from [dbo].[FactExchangeRate]
)
select
    TargetCurrency,
    DateKey,
    CurrentRate,
    PreviousRate,
    CurrentRate - PreviousRate as [Change],
    (CurrentRate - PreviousRate) / PreviousRate * 100 as Change_Percentage
from RateComparison
where RowNum = 1;


