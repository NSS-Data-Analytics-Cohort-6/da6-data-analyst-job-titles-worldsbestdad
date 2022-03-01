/* I am testing sql and maybe
just maybe
it will let me save something this time */

--Q1. How many rows are in the data_analyst_jobs table?
select count(*)
from data_analyst_jobs;

--Q2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
select *
from data_analyst_jobs
limit 10;
-- ExxonMobil is the 10th row company!

--Q3. How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
select count(*)
from data_analyst_jobs
where location = 'TN';
-- 21 TN Jobs!

-- Q4. How many postings in Tennessee have a star rating above 4?
select count(*)
from data_analyst_jobs
where location = 'TN'
and star_rating > 4;
-- 3 TN Jobs that don't stink!

--Q5. How many postings in the dataset have a review count between 500 and 1000?
select count(*)
from data_analyst_jobs
where review_count between 500 and 1000;
-- 151 Moderately reviewed postings!

/*Q6. Show the average star rating for companies in each state. 
The output should show the state as state and the average rating for the state as avg_rating. 
Which state shows the highest average rating? */
select location,
avg(star_rating) as avg_rating
from data_analyst_jobs
where star_rating is not null
group by location
order by avg_rating desc;
--Highest avg rating is Nebraska(???) with a 4.19 rating

--Q7. Select unique job titles from the data_analyst_jobs table. How many are there?
select count(distinct title)
from data_analyst_jobs;
--881 Unique jobs titles

--Q8. How many unique job titles are there for California companies?
select count(distinct title)
from data_analyst_jobs
where location='CA';
--230 in Cali alone, that's 1/4th of the unique names!

/* Q9. Find the name of each company and its average star rating for all 
companies that have more than 5000 reviews across all locations.
How many companies are there with more that 5000 reviews across all locations? */
select company,
avg(star_rating) as avg_rating,
sum(review_count) as total_reviews
from data_analyst_jobs
where company is not null
group by company
having sum(review_count)>5000;
--Looks like we have 70 companies with 5000+ reviews across all locations.

/* Q10. Add the code to order the query in #9 from highest to 
lowest average star rating. Which company with more than 5000 reviews 
across all locations in the dataset has the highest star rating? What is that rating? */
select company,
avg(star_rating) as avg_rating,
sum(review_count) as total_reviews
from data_analyst_jobs
where company is not null
group by company
having sum(review_count)>5000
order by total_reviews desc;
--Walmart has the most total reviews, not a big surprise

--Q11. Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
select count(distinct title)
from data_analyst_jobs
where title ilike '%analyst%';
--Total of 774 unique job titles that have the word analyst in there!

/* Q12. How many different job titles do not contain either the word ‘Analyst’ 
or the word ‘Analytics’? What word do these positions have in common? */
select distinct title
from data_analyst_jobs
where title not ilike '%analyst%'
and title not ilike '%analytics%';
--They all want you to use Tableau, interesting

/* BONUS. You want to understand which jobs requiring SQL are hard to fill. 
Find the number of jobs by industry (domain) that require SQL and have been 
posted longer than 3 weeks.
	-Disregard any postings where the domain is NULL.
	-Order your results so that the domain with the greatest 
	 number of hard to fill jobs is at the top.
	-Which three industries are in the top 4 on this list? 
	 How many jobs have been listed for more than 3 weeks for each of the top 4? */
select domain,
count(title) as job_postings
from data_analyst_jobs
where skill ilike '%sql%'
and days_since_posting > 3*7
and domain is not null
group by domain
order by count(title) desc;
-- Top 4 industries are internet and software, banks and financial services, consulting and buisness services, and health care
-- Top 4 jobs posting numbers are 62, 61, 57, and 52.
