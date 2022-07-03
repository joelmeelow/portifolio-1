/*  
   Hotel Data Exploration
   Skills used: Joins, CTE's, Aggregate Functios, creating views, Unions

*/



use [project 2]


--joining market_segment and the meal table to the hotels table


select * from dbo.[hotel_2018]

select * from dbo.[hotel_2019]

select * from dbo.[hotel_2020])

select * from [dbo].[market_segment$]

select * from [dbo].[meal_cost$]



with hotels as (

select * from dbo.[hotel_2018]
union
select * from dbo.[hotel_2019]
union
select * from dbo.[hotel_2020])

select * 
from hotels
left join dbo.market_segment$
on hotels.market_segment = market_segment$.market_segment
left join dbo.meal_cost$
on hotels.meal = dbo.meal_cost$.meal



 
--the total number of adults  that stayed in weekends and week nights 




with hotels as (

select * from dbo.[hotel_2018]
union
select * from dbo.[hotel_2019]
union
select * from dbo.[hotel_2020])

select sum(stays_in_weekend_nights) total_stays_weekend_nights,
       sum(stays_in_week_nights)total_stays_in_week_nights,
	   sum(adults)total_adults, 
	   sum(children)total_children,
	   sum(babies)total_babies,
	       arrival_date_month,
		   customer_type,
	   arrival_date_year
from hotels

group by arrival_date_month, arrival_date_year, customer_type--
order by arrival_date_year



-- the total number of transient customers in 3 years



with hotels as (

select * from dbo.[hotel_2018]
union
select * from dbo.[hotel_2019]
union
select * from dbo.[hotel_2020])


select sum(stays_in_weekend_nights) total_stays_weekend_nights,
       sum(stays_in_week_nights)total_stays_in_week_nights,
	   sum(adults)total_adults, 
	   sum(children)total_children,
	   sum(babies)total_babies,
	       arrival_date_year
from hotels
where customer_type like '%transient%'
group by arrival_date_year
order by arrival_date_year



-- to determnine the hotel revenue by year and hotel type




with hotels as (

select * from dbo.[hotel_2018]
union
select * from dbo.[hotel_2019]
union
select * from dbo.[hotel_2020])

select arrival_date_year, hotel,
round(sum((stays_in_week_nights + stays_in_weekend_nights)* adr),2) as revenue from hotels
group by arrival_date_year, hotel





-- creating view to store data for visualization




create view  hotel_stat as
with hotels as (

select * from dbo.[hotel_2018]
union
select * from dbo.[hotel_2019]
union
select * from dbo.[hotel_2020])


select sum(stays_in_weekend_nights) total_stays_weekend_nights,
       sum(stays_in_week_nights)total_stays_in_week_nights,
	   sum(adults)total_adults, 
	   sum(children)total_children,
	   sum(babies)total_babies,
	       arrival_date_month,
		   customer_type,
	   arrival_date_year
from hotels

group by arrival_date_month, arrival_date_year, customer_type--
--order by arrival_date_year


