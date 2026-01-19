DROP database if exists employee_analytics_practice;
CREATE DATABASE employee_analytics_practice;
USE employee_analytics_practice;
 
 CREATE TABLE employee_performance (
    employee_id VARCHAR(10),
    employee_name VARCHAR(50),
    department VARCHAR(50),
     location VARCHAR(50),
    designation VARCHAR(50),
    monthly_target INT,
    monthly_achievement INT,
    performance_rating INT,
    bonus_eligibility VARCHAR(10)
    
); 
 show tables;
  SELECT  * FROM employee_performance;
 INSERT INTO employee_performance 
(employee_id, employee_name, department, location, monthly_target, monthly_achievement, performance_rating, bonus_eligibility)
VALUES
(1, 'Rahul', 'Sales', 'Bangalore', 100000, 95000, 4, 'No'),
(2, 'Anita', 'HR', 'Hyderabad', 60000, 65000, 5, 'Yes'),
(3, 'Kiran', 'Finance', 'Mumbai', 80000, 78000, 3, 'No'),
(4, 'Priya', 'Sales', 'Delhi', 90000, 92000, 4, 'Yes'),
(5, 'Ramesh', 'Operations', 'Chennai', 70000, 72000, 4, 'Yes'),
(6, 'Neha', 'HR', 'Bangalore', 65000, 60000, 3, 'No'),
(7, 'Arjun', 'Finance', 'Hyderabad', 85000, 88000, 5, 'Yes'),
(8, 'Sneha', 'Sales', 'Mumbai', 95000, 91000, 4, 'No'),
(9, 'Vikram', 'Operations', 'Delhi', 72000, 75000, 4, 'Yes'),
(10, 'Pooja', 'HR', 'Chennai', 60000, 63000, 4, 'Yes'),
(11, 'Amit', 'Finance', 'Bangalore', 90000, 87000, 4, 'No'),
(12, 'Divya', 'Sales', 'Hyderabad', 98000, 102000, 5, 'Yes'),
(13, 'Suresh', 'Operations', 'Mumbai', 75000, 73000, 3, 'No'),
(14, 'Meena', 'HR', 'Delhi', 62000, 65000, 4, 'Yes'),
(15, 'Rohit', 'Finance', 'Chennai', 88000, 91000, 5, 'Yes'),
(16, 'Kavya', 'Sales', 'Bangalore', 97000, 94000, 4, 'No'),
(17, 'Manoj', 'Operations', 'Hyderabad', 76000, 80000, 5, 'Yes'),
(18, 'Asha', 'HR', 'Mumbai', 64000, 60000, 3, 'No'),
(19, 'Nikhil', 'Finance', 'Delhi', 89000, 92000, 5, 'Yes'),
(20, 'Swati', 'Sales', 'Chennai', 96000, 99000, 5, 'Yes');

select count(*)from employee_performance;

select count(*) as Total_employees 
from employee_performance;

select department,count(*) as  no_employees
from employee_performance
group by department;

select employee_name,department,monthly_achievement,monthly_target
from employee_performance
where monthly_achievement>= monthly_target;

select employee_name,monthly_achievement
from employee_performance
order by monthly_achievement DESC
limit 5;

select department,round(avg( monthly_achievement),2) as Avg_Monthly_achievement
from employee_performance
group by department;
SELECT employee_name,
       department,
       monthly_target,
       monthly_achievement,
       (monthly_achievement - monthly_target) AS performance_gap
FROM employee_performance;

 SELECT employee_name,
       department,
       monthly_achievement,
       RANK() OVER (PARTITION BY department ORDER BY monthly_achievement DESC) AS dept_rank
FROM employee_performance;

select employee_name,department,monthly_target,
monthly_achievement,
CASE
   WHEN monthly_achievement>= monthly_target THEN 'yes'
     ELSE 'no'
     END AS bonus_status
from employee_performance;

select department,count(*)  as total_employees,
SUM(CASE
 WHEN monthly_achievement>= monthly_target THEN 1
      ELSE 0 
      END )AS bonus_eligible_employees,
      SUM(CASE
    WHEN monthly_achievement< monthly_target THEN 1
      ELSE 0 
      END )AS not_eligible_employees
     FROM employee_performance
     group by department;
SELECT 
    employee_name,
    department,
    monthly_target,
    monthly_achievement,
    (monthly_achievement - monthly_target) AS performance_gap
FROM employee_performance;

 select location,
 round(Avg(monthly_achievement),2) as Avg_Performance
 from employee_performance
 group by location;
 
select employee_name,department,location,monthly_achievement,
rank() over(partition by location order by monthly_achievement desc) as rank_by_location
from employee_performance;
SELECT *
FROM (
    SELECT 
        employee_name,
        department,
        location,
        monthly_achievement,
        RANK() OVER (PARTITION BY location ORDER BY monthly_achievement DESC) AS location_rank
    FROM employee_performance
) ranked
WHERE location_rank = 1;

select  department,
round(avg(monthly_achievement),2) as Avg_monthly_achievement
from employee_performance
group by department  order by avg_monthly_achievement desc
limit 3;
select location,
round(avg(monthly_achievement),2) as Avg_monthly_achievement
from employee_performance
group by  location order by avg_monthly_achievement desc
limit 3;

 select employee_name,department,location,monthly_achievement
 from employee_performance
 order by monthly_achievement desc
 limit 3;
 SELECT *
FROM (
    SELECT 
        employee_name,
        department,
        monthly_achievement,
        RANK() OVER (PARTITION BY department ORDER BY monthly_achievement DESC) AS dept_rank
    FROM employee_performance
) ranked
WHERE dept_rank = 1;
SELECT 
    department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN monthly_achievement >= monthly_target THEN 1 ELSE 0 END) AS bonus_count
FROM employee_performance
GROUP BY department;