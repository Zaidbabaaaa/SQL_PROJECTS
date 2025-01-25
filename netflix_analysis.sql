DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
	show_id	VARCHAR(5),
	type    VARCHAR(10),
	title	VARCHAR(250),
	director VARCHAR(550),
	casts	VARCHAR(1050),
	country	VARCHAR(550),
	date_added	VARCHAR(55),
	release_year	INT,
	rating	VARCHAR(15),
	duration	VARCHAR(15),
	listed_in	VARCHAR(250),
	description VARCHAR(550)
);
select * from netflix;

-- 1. Count the number of Movies vs TV Shows

	select type,count(type)
	from netflix
	group by type;


-- 2. Find the most common rating for movies and TV shows

	
	select type,rating,count(rating)as no_of_rating
	from netflix
	group by type,rating
	order by type,no_of_rating desc ;

-- 3. List all movies released in a specific year (e.g., 2020)

	
	select * from netflix
	where type= 'Movie'
	and release_year=2020;
	

-- 4. Find the top 5 countries with the most content on Netflix

	select country,count(country)as top_country
	from netflix 
	group by country 
	order by top_country desc limit 5;

-- 5. Find content added in the last 5 years

	select * from netflix
	
SELECT CURRENT_DATE()- INTERVAL '5 years';


-- 6. Find all the movies/TV shows by director 'Rajiv Chilaka'!

	select * from netflix
	where director='Rajiv Chilaka';
	--or--

	select * from netflix
	where director like '%Rajiv Chilaka%';
	


-- 7. List all TV shows with more than 5 seasons---(we used split part() function here to seperate season column
--and then converted the text numbeer into numeric for comparision )

	select *
	from netflix
	where type = 'TV Show'
	and
	split_part(duration,' ',1):: numeric > 5;

-- 8. Count the number of content items in each genre

	select * from netflix

	select listed_in,count(*) as total_content
	from netflix
	group by 1;
	--or--
	select unnest(string_to_array(listed_in,','))as genre,
	count(*)
	from netflix
	group by 1;

-- 9.Find each year and the average numbers of content release in India on netflix.
--return top 5 years with highest average content  release

	select extract(year from to_date(date_added,'Month DD,YYYY'))as year,
	count(*)as content_per_year,
	count(*)::numeric/(select count(*) from netflix where country = 'India')::numeric*100 as yearly_avg_indian_content
	from netflix
	where country = 'India'
	group by 1
	order by yearly_avg_indian_content desc  limit 5 ;
	
	

-- 10. List all movies that are documentaries

	select * from netflix
	where type = 'Movie' and
	listed_in = 'Documentaries';



-- 11. Find all content without a director

	select * from netflix
	where director is null;


-- 12. Find how many movies actor 'Salman Khan' appeared in last 10 years!

	select count(*) from netflix
	where casts ilike '%salman khan%'
	and release_year > extract(year from current_date)-10





-- 13. Find the top 10 actors who have appeared in the highest number of movies produced in India.

	select
	unnest(string_to_array(casts,',')) as actors,count(show_id)as total_shows
	from netflix
	where country = 'India'
	group by actors
	order by total_shows desc ;
	select * from netflix

	
-- 14.
-- Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
-- the description field. Label content containing these keywords as 'Bad' and all other 
-- content as 'Good'. Count how many items fall into each category.

	with table_1
	as
	(
		select *,
	case
	when description ilike '%kill%' or
	description ilike '%voilence%' then 'Bad_content'
	else 'Good_content'
	end category
	from netflix

	)
	select category, count(*)
	from table_1
	group by 1;

	
	
	