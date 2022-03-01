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