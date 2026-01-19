Employee Performance & Productivity Analytics (SQL Project)
Project Overview

This project focuses on analyzing employee productivity, performance trends, and bonus eligibility using SQL. The goal is to help management make data-driven decisions related to performance improvement, incentive planning, and workforce optimization.

The analysis provides department-wise and location-wise insights, identifies top performers, and tracks performance gaps between targets and achievements.

This project simulates a real-world HR and business analytics scenario.

Business Objective

To help management:

Monitor employee productivity and performance

Track monthly targets vs achievements

Identify top-performing employees

Analyze department and location productivity

Plan bonus and incentive budgets

Improve underperforming teams

Dataset Description

The dataset contains employee performance information with the following fields:

Column Name	Description
employee_id	Unique employee ID
employee_name	Employee full name
department	Department name
location	Work location
monthly_target	Monthly performance target
monthly_achievement	Monthly performance achieved
performance_rating	Performance rating (1–5)
bonus_eligibility	Bonus eligibility status

Total Records: 20 employees

Tools & Technologies Used

MySQL

MySQL Workbench

SQL (Joins, Aggregations, Window Functions, CASE Statements)

Excel (for initial data exploration & dashboarding)

Analysis Performed
1. Workforce Overview

Total number of employees

Department-wise headcount

2. Performance Analysis

Monthly target vs achievement tracking

Performance gap calculation

Identification of employees meeting targets

3. KPI Metrics

Bonus eligibility flag using business logic

Department-wise bonus summary

Incentive planning metrics

4. Productivity Analysis

Department-wise average monthly achievement

Location-wise productivity analysis

Best performing department and location

5. Ranking & Leadership Insights

Top 3 performers across the organization

Best performer in each department

Location-wise employee ranking

Key Business Insights

Best Performing Department: Sales

Best Performing Location: Bangalore

Identified top-performing employees for rewards and leadership roles

Created performance gap metrics for improvement planning

Built bonus eligibility KPIs for incentive budgeting

Sample SQL Queries
Bonus Eligibility KPI
SELECT 
    employee_name,
    department,
    monthly_target,
    monthly_achievement,
    CASE 
        WHEN monthly_achievement >= monthly_target THEN 'Yes'
        ELSE 'No'
    END AS bonus_status
FROM employee_performance;

Department Bonus Summary
SELECT 
    department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN monthly_achievement >= monthly_target THEN 1 ELSE 0 END) AS bonus_eligible_employees
FROM employee_performance
GROUP BY department;

Top Performers
SELECT 
    employee_name,
    department,
    location,
    monthly_achievement
FROM employee_performance
ORDER BY monthly_achievement DESC
LIMIT 3;

Business Impact

This analysis enables management to:

Reward high-performing employees

Improve underperforming teams

Allocate bonus budgets efficiently

Expand operations in high-performing locations

Build leadership pipelines using performance data

Project Outcome

This project demonstrates real-world business analytics using SQL and showcases the ability to:

Build KPI metrics

Perform performance analysis

Apply window functions and ranking

Generate executive-level insights

Author

Munisha 
Aspiring Data Analyst / Business Analyst
SQL | Excel | Tableau | Business Analytics

 
