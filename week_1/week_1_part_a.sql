/*Question 3 */

select
	count(*)
from
	green_taxi_data gtd
where
	cast(date_part('month',lpep_pickup_datetime) as integer) = 1
	and cast(date_part('month',lpep_dropoff_datetime) as integer) = 1
	and cast(date_part('day',lpep_pickup_datetime) as integer) = 15
	and cast(date_part('day',lpep_dropoff_datetime) as integer) = 15

	
/* Question 4*/
	
select
	lpep_pickup_datetime
from
	green_taxi_data gtd
order by
	trip_distance desc
limit 1;
	
/* Question 5*/
	
select
	passenger_count,
	count(*)
from
	green_taxi_data gtd
where
	passenger_count in (2, 3)
	and lpep_pickup_datetime >= '2019-01-01 00:00:00'
	and lpep_dropoff_datetime <= '2019-01-01 23:59:59'
group by
	passenger_count
	
/* Question 6*/
	
with x as (SELECT 
	(select taxi_zones."Zone" from taxi_zones where "LocationID" = "PULocationID") as pickup_location, 
	(select taxi_zones."Zone" from taxi_zones where "LocationID" = "DOLocationID") as dropoff_location, 
	tip_amount
	FROM public.green_taxi_data)
select * from x
where pickup_location = 'Astoria'
order by tip_amount desc;
