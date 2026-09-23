-- Analyze The Evolution Of Average Listing Price Over Time!
-- To Identify Pricing Trends Across The Date Range!
SELECT
  date AS date_date,
  ROUND(AVG(price), 2) AS average_price
FROM `abnb0726-090726-p8.course25.airbnb_calendar_list_join`
WHERE price IS NOT NULL
GROUP BY date
ORDER BY date;