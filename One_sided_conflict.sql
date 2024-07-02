-- **[TOTAL INCIDENTS AND FATALITIES]**

-- 1. Calculate the total number of incidents reported.

select format(count(*),0) as `total number of incidents`
from one_sided_conflict
;

-- 2. Calculate the total number of fatalities (using best_fatality_estimate).

select sum(best_fatality_estimate)  as `total number of fatalities`
from one_sided_conflict
;
select round(sum(best_fatality_estimate), -4) as `total number of fatalities`
from one_sided_conflict
;
select format(sum(best_fatality_estimate), 0) as `total number of fatalities`
from one_sided_conflict
;

-- 3. Calculate the average number of fatalities per incident.

select avg(best_fatality_estimate) as `avg fatality per incident`
from one_sided_conflict
;

-- 4. Difference between hight fatality estimate and low fatality estimate for each incident
select format(high_fatality_estimate - low_fatality_estimate,0) as `difference between high and low fatality estimate` ,  actor_name_fulltext
from one_sided_conflict
order by high_fatality_estimate - low_fatality_estimate desc
;
-- 5. average difference between high fatality estimate and low fatality estimate
select format(avg(high_fatality_estimate - low_fatality_estimate), 0)as `difference between high and low fatality estimate`
from one_sided_conflict
;

-- 6. Identify the incident with the lowest fatality estimate.

select actor_name_fulltext as `actor name`, year, best_fatality_estimate as `fatility`
from one_sided_conflict
where best_fatality_estimate = (
	select min(best_fatality_estimate) 
    from one_sided_conflict
    )
order by year desc
;

-- 7. Identify the incident with the highest fatality estimate. 

select format(high_fatality_estimate,0) , year, actor_name_fulltext
from one_sided_conflict
where high_fatality_estimate = (
select max(high_fatality_estimate) 
from one_sided_conflict)
;

-- **[ACTORS INVOLVED]**

-- 1. Count of unique actors involved.

select count(distinct actor_name_fulltext) as `number of unique actors`
from one_sided_conflict
;

-- 2. Name of unique actors involved.

select distinct actor_name_fulltext as `name of unique actors`
from one_sided_conflict
order by actor_name_fulltext asc
;

-- 3. Retrieve the total count and names of all actors that have "Army" in their name.

Select count(*) as `number of incidents`
from one_sided_conflict
where actor_name_fulltext like '%Army%'
;
select distinct actor_name_fulltext as `actor name` , count(*) as `number of conflicts`
from one_sided_conflict
where actor_name_fulltext like '%Army%'
group by `actor name`
order by `number of conflicts` desc
;

-- 4. Identify the top 5 actors involved in one-sided violence based on the number of incidents.

select actor_name_fulltext as `Actor name` , count(*) as `number of incidents`
from one_sided_conflict
group by actor_name_fulltext
order by count(*) desc
limit 5
;
-- 5. Find the actor responsible for the highest number of fatalities in a single year.

select actor_name_fulltext as `actor name`, year, format(sum(best_fatality_estimate),0) as `total fatalities`
from one_sided_conflict
group by `actor name`, `year`
order by sum(best_fatality_estimate) desc
limit 1
;

-- **[GOVERNMENT VS NON-GOVERNMENT ACTORS]**

-- 1. Differentiate between government actors and non-government actors.

select distinct actor_name_fulltext as `actorname`,
	case
    when actor_name_fulltext like '%government%' then 'government actor'
    else 'non-government actor'
	end as `type`
from one_sided_conflict
Order by `type`, `actorname`
;

-- 2. Find the total number of incidents that involve government actors and name of government actors.

select distinct count(*) as 'number of incidents'
from one_sided_conflict
where actor_name_fulltext like '%government%' 
;

select distinct actor_name_fulltext as `actorname`,  count(*) as `number of incidents`
from one_sided_conflict
where actor_name_fulltext like '%government%' 
group by actor_name_fulltext
order by count(*)	desc
;

-- 3. Calculate the percentage of incidents involving government actors.

select (
		concat(
		round((
		select count(*)
    from one_sided_conflict
    where actor_name_fulltext like '%government%') 
		/
		(select count(*)
		from one_sided_conflict
    where actor_name_fulltext not like '%government%') 
		* 100, 0)
		, '%')) as `percentage of government actors`
;

-- 4 Compare the average fatality estimates of government actors versus non-government actors.

select (
	select format(avg(best_fatality_estimate), 0)
    from one_sided_conflict
    where actor_name_fulltext like '%government%'
    )
    as `avg f.e (government)`,
    (
    select format(avg(best_fatality_estimate), 0)
    from one_sided_conflict
    where actor_name_fulltext not like '%government%')
    as `avg f.e (non-government)`
;

-- 5. Analyze if there is more discrepancy between high and low fatality estimates when the government is involved versus when it is not.

select (
	select format(avg(high_fatality_estimate - low_fatality_estimate),0)
    from one_sided_conflict
    where actor_name_fulltext like '%government%'
    ) as `avg difference bw high and low f.e (Government)`,
    
    ( select format(avg(high_fatality_estimate - low_fatality_estimate), 0)
    from one_sided_conflict
    where actor_name_fulltext not like '%government%'
    ) as `avg difference bw high and low f.e (non - Government)`
    ;
    
-- **[TEMPORAL ANALYSIS]**

-- 1. List all the years in which incidents were reported and the number of incidents in each year.

select count(distinct year) 
from one_sided_conflict
order by year desc
;

-- 2. Identify the number of incidents per year.

select year, count(*) as `number of incidents`
from one_sided_conflict
group by year
order by count(*) desc
;

-- 3. Identify the top 5 years with the highest total fatalities.

select year, format(sum(best_fatality_estimate),0) as `total fatality`
from one_sided_conflict
group by year
order by `total fatality` desc
limit 5
;

-- 4. Find the distribution of incidents across different years.

select year, count(*) as `number of incidents`
from one_sided_conflict
group by year
order by count(*) desc
;

-- 5. Identify any significant trends or changes in the fatality estimates over decades (e.g., 1990-1999, 2000-2009, etc.).

select format(sum(best_fatality_estimate), 0) as `total f.e`,
(case 
when year between 1989 and 1999 then '1990 - 1999'
when year between 2000 and 2009 then '2000 - 2009'
when year between 2010 and 2023 then '2010 - 2023'
end) as 'decade'
from one_sided_conflict
group by `decade`
order by sum(best_fatality_estimate) desc
;

select format(sum(best_fatality_estimate), 0) as `total f.e`,
(case 
when year like '19%' then '1990 - 1999'
when year like '200%' then '2000 - 2009'
when year like '201%' or year like '202%' then '2010 - 2023'
end) as 'decade'
from one_sided_conflict
group by `decade`
order by `decade` asc
;

-- **[GEOGRAPHICAL ANALYSIS]**

-- 1. Identify the locations with the highest number of incidents.

select location , count(conflict_id) as `number of incidents`
from one_sided_conflict
group by location
order by `number of incidents` desc
limit 1
;

-- 2. Count the number of incidents that occurred in each location.

select count(*) as `number of incidents` , location,
dense_rank () over (order by count(*)) as `rank`
from one_sided_conflict
group by location
order by count(*) desc
;

-- **[COALITION COMPONENTS AND COLLABORATION]**

-- 1. Identify the top 2 actors with the most frequent collaboration (appearing together in coalition components).

select coalition_components, count(*) as `number of incidents`, actor_name_fulltext as `actor name`
from one_sided_conflict
where coalition_components > 0
group by coalition_components,  actor_name_fulltext
order by count(*) desc
limit 2
;

-- 2. Determine if there is any correlation between the number of coalition components and the fatality estimates.

select (
	select format(avg(best_fatality_estimate), 0)
	from one_sided_conflict
    where coalition_components > 0
    ) as `avf f.e (coalition)`,
    (select format(avg(best_fatality_estimate), 0)
    from one_sided_conflict
    where coalition_components = 0
    ) as `avg f.e (no coalition)`
    ;
