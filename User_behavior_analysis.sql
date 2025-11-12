USE user_behavior;
SELECT * from user_behavior_dataset;
SHOW COLUMNS FROM user_behavior_dataset;

#1.  How many unique users are in the dataset?
SELECT COUNT(DISTINCT `User ID`) AS total_users FROM user_behavior_dataset;

#2. Which 5 users have the highest average screen time per day?
SELECT `User ID`, SUM(CAST(`Screen On Time (hours/day)` AS DECIMAL(10,2))) AS total_screen_time FROM user_behavior_dataset
GROUP BY `User ID`
ORDER BY total_screen_time DESC
LIMIT 5;

#3. What is the average app usage time for each operating system?
SELECT `Operating System`, AVG(`App Usage Time (min/day)`) AS avg_app_usage_time FROM user_behavior_dataset
GROUP BY `Operating System` 
ORDER BY avg_app_usage_time DESC;

#4. Which device models consume the most battery on average?
SELECT `Device Model`, ROUND(AVG(`Battery Drain (mAh/day)`), 2) AS avg_battery_drain FROM user_behavior_dataset
GROUP BY `Device Model` 
ORDER BY avg_battery_drain DESC
LIMIT 5;

#5. How does average screen time relate to average data usage?
SELECT ROUND(AVG(`Screen On Time (hours/day)`), 2) AS avg_screen_time,
ROUND(AVG(`Data Usage (MB/day)`), 2) AS avg_data_usage
FROM user_behavior_dataset;

#6. Which user behavior class is most common?
SELECT `User Behavior Class`, COUNT(*) AS user_count FROM user_behavior_dataset
GROUP BY `User Behavior Class` 
ORDER BY user_count DESC;

#7. How many apps do male and female users install on average?
SELECT `Gender`, AVG(`Number of Apps Installed`) AS avg_apps_installed FROM user_behavior_dataset
GROUP BY `Gender`;

#8. Which operating system users consume the most mobile data?
SELECT `Operating System`, ROUND(AVG(`Data Usage (MB/day)`), 2) AS avg_data_usage FROM user_behavior_dataset
GROUP BY `Operating System`
ORDER BY avg_data_usage DESC;

#9. Which users have high screen time but low app usage?
SELECT `User ID`, `Screen On Time (hours/day)`, `App Usage Time (min/day)` FROM user_behavior_dataset
WHERE `Screen On Time (hours/day)` > 3 AND `App Usage Time (min/day)` < 100
ORDER BY `Screen On Time (hours/day)` DESC;

#10. Do male or female users spend more time on their screens on average?
SELECT `Gender`, AVG(CAST(`Screen On Time (hours/day)` AS DECIMAL(10,2))) AS avg_screen_time FROM user_behavior_dataset
GROUP BY `Gender`
ORDER BY avg_screen_time DESC;

#11. Which users spend more than 10 hours daily on screen?
SELECT `User ID`, `Screen On Time (hours/day)` FROM user_behavior_dataset
WHERE `Screen On Time (hours/day)` > 10
ORDER BY `Screen On Time (hours/day)` DESC;

#12. Does installing more apps cause higher battery drain?
SELECT ROUND(AVG(`Number of Apps Installed`), 0) AS avg_apps_installed,
ROUND(AVG(`Battery Drain (mAh/day)`), 2) AS avg_battery_drain 
FROM user_behavior_dataset;

#13. Which device models have the highest average number of installed apps?
SELECT `Device Model`, ROUND(AVG(`Number of Apps Installed`), 0) AS avg_apps_installed FROM user_behavior_dataset
GROUP BY `Device Model`
ORDER BY avg_apps_installed DESC
LIMIT 5;

#14. Which user behavior class consumes the most data per day on average?
SELECT `User Behavior Class`, ROUND(AVG(`Data Usage (MB/day)`), 2) AS avg_data_usage FROM user_behavior_dataset
GROUP BY `User Behavior Class`
ORDER BY avg_data_usage DESC;

#15. What is the average data usage per age group?
SELECT
  CASE
    WHEN `Age` < 20 THEN 'Below 20'
    WHEN `Age` BETWEEN 20 AND 29 THEN '20s'
    WHEN `Age` BETWEEN 30 AND 39 THEN '30s'
    WHEN `Age` BETWEEN 40 AND 49 THEN '40s'
    ELSE '50+'
  END AS age_group,
ROUND(AVG(`Data Usage (MB/day)`), 2) AS avg_data_usage FROM user_behavior_dataset
GROUP BY age_group
ORDER BY avg_data_usage DESC;

